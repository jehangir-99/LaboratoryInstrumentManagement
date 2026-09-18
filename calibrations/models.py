from django.db import models


class Calibration(models.Model):

    STATUS_CHOICES = [
        ('scheduled', 'Scheduled'),
        ('completed', 'Completed'),
        ('overdue', 'Overdue'),
        ('failed', 'Failed'),
    ]

    instrument = models.ForeignKey(
        'instruments.Instrument',
        on_delete=models.CASCADE,
        related_name='calibrations'
    )

    calibration_date = models.DateField()

    next_calibration_date = models.DateField(
        null=True,
        blank=True
    )

    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='scheduled'
    )

    certificate_number = models.CharField(
        max_length=100,
        blank=True
    )

    performed_by = models.CharField(
        max_length=200,
        blank=True
    )

    remarks = models.TextField(
        blank=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = ['-calibration_date']

    def __str__(self):
        return f"{self.instrument.internal_code} - {self.calibration_date}"
from django.db import models


class Maintenance(models.Model):

    MAINTENANCE_TYPE_CHOICES = [
        ('preventive', 'Preventive Maintenance'),
        ('corrective', 'Corrective Maintenance'),
    ]

    instrument = models.ForeignKey(
        'instruments.Instrument',
        on_delete=models.CASCADE,
        related_name='maintenances'
    )

    maintenance_type = models.CharField(
        max_length=20,
        choices=MAINTENANCE_TYPE_CHOICES
    )

    intervention_date = models.DateField()

    responsible_technician = models.CharField(
        max_length=200
    )

    report = models.TextField(
        blank=True
    )

    replaced_parts = models.TextField(
        blank=True
    )

    next_maintenance_date = models.DateField(
        null=True,
        blank=True
    )

    notes = models.TextField(
        blank=True
    )

    report_file = models.FileField(
        upload_to='maintenance_reports/',
        blank=True,
        null=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = ['-intervention_date']

    def __str__(self):
        return (
            f"{self.instrument.internal_code} - "
            f"{self.intervention_date}"
        )
from django.db import models


class Instrument(models.Model):

    STATUS_CHOICES = [
        ('in_service', 'In Service'),
        ('out_of_service', 'Out of Service'),
        ('maintenance', 'In Maintenance'),
    ]

    internal_code = models.CharField(
        max_length=50,
        unique=True
    )

    designation = models.CharField(
        max_length=200
    )

    brand = models.CharField(
        max_length=100
    )

    model = models.CharField(
        max_length=150
    )

    serial_number = models.CharField(
        max_length=150
    )

    location = models.ForeignKey(
        'locations.Location',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='instruments'
    )

    supplier = models.ForeignKey(
        'suppliers.Supplier',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='instruments'
    )

    purchase_date = models.DateField(
        null=True,
        blank=True
    )

    commissioning_date = models.DateField(
        null=True,
        blank=True
    )

    status = models.CharField(
        max_length=30,
        choices=STATUS_CHOICES,
        default='in_service'
    )

    photo = models.ImageField(
        upload_to='instruments/',
        null=True,
        blank=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = ['internal_code']

    def __str__(self):
        return f"{self.internal_code} - {self.designation}"
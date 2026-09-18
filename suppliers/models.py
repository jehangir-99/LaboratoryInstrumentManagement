from django.db import models


class Supplier(models.Model):
    name = models.CharField(max_length=200)

    contact_person = models.CharField(
        max_length=150,
        blank=True
    )

    phone = models.CharField(
        max_length=50,
        blank=True
    )

    email = models.EmailField(
        blank=True
    )

    address = models.TextField(
        blank=True
    )

    website = models.URLField(
        blank=True
    )

    notes = models.TextField(
        blank=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name

class Location(models.Model):

    name = models.CharField(
        max_length=200
    )

    building = models.CharField(
        max_length=200,
        blank=True
    )

    room = models.CharField(
        max_length=100,
        blank=True
    )

    def __str__(self):
        return self.name
from django.contrib.auth.models import User
from django.db import models


class UserProfile(models.Model):

    ROLE_CHOICES = [
        ('administrator', 'Administrator'),
        ('laboratory_manager', 'Laboratory Manager'),
        ('standard_user', 'Standard User'),
    ]

    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='profile'
    )

    role = models.CharField(
        max_length=30,
        choices=ROLE_CHOICES,
        default='standard_user'
    )

    phone = models.CharField(
        max_length=30,
        blank=True
    )

    department = models.CharField(
        max_length=150,
        blank=True
    )

    is_active = models.BooleanField(
        default=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    def __str__(self):
        return f"{self.user.username} - {self.get_role_display()}"
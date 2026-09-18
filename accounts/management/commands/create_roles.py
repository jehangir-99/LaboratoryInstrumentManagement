from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group, Permission


class Command(BaseCommand):

    help = 'Create laboratory roles and assign permissions'

    def handle(self, *args, **kwargs):

        # Create groups
        administrator, _ = Group.objects.get_or_create(
            name='Administrator'
        )

        laboratory_manager, _ = Group.objects.get_or_create(
            name='Laboratory Manager'
        )

        standard_user, _ = Group.objects.get_or_create(
            name='Standard User'
        )

        # Get permissions
        all_permissions = Permission.objects.all()

        # Administrator gets everything
        administrator.permissions.set(
            all_permissions
        )

        # Laboratory Manager permissions
        manager_permissions = Permission.objects.filter(
            content_type__app_label__in=[
                'instruments',
                'calibrations',
                'maintenance',
                'suppliers',
            ]
        )

        laboratory_manager.permissions.set(
            manager_permissions
        )

        # Standard User gets view permissions only
        standard_permissions = Permission.objects.filter(
            content_type__app_label__in=[
                'instruments',
                'calibrations',
                'maintenance',
                'suppliers',
            ],
            codename__startswith='view_'
        )

        standard_user.permissions.set(
            standard_permissions
        )

        self.stdout.write(
            self.style.SUCCESS(
                'Laboratory roles and permissions configured successfully.'
            )
        )
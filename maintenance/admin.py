from django.contrib import admin
from .models import Maintenance


@admin.register(Maintenance)
class MaintenanceAdmin(admin.ModelAdmin):

    list_display = (
        'instrument',
        'maintenance_type',
        'intervention_date',
        'responsible_technician',
        'next_maintenance_date',
    )

    list_filter = (
        'maintenance_type',
        'intervention_date',
    )

    search_fields = (
        'instrument__internal_code',
        'instrument__designation',
        'responsible_technician',
        'replaced_parts',
    )

    date_hierarchy = 'intervention_date'
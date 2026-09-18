from django.contrib import admin

from .models import Calibration


@admin.register(Calibration)
class CalibrationAdmin(admin.ModelAdmin):

    list_display = (
        'instrument',
        'calibration_date',
        'next_calibration_date',
        'status',
        'certificate_number',
        'performed_by',
    )

    list_filter = (
        'status',
        'calibration_date',
        'next_calibration_date',
    )

    search_fields = (
        'instrument__internal_code',
        'instrument__designation',
        'certificate_number',
        'performed_by',
    )

    ordering = (
        '-calibration_date',
    )
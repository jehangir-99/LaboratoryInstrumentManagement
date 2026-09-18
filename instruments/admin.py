from django.contrib import admin
from .models import Instrument


@admin.register(Instrument)
class InstrumentAdmin(admin.ModelAdmin):

    list_display = (
        'internal_code',
        'designation',
        'brand',
        'model',
        'serial_number',
        'location',
        'supplier',
        'status',
    )

    list_filter = (
        'status',
        'location',
        'supplier',
    )

    search_fields = (
        'internal_code',
        'designation',
        'brand',
        'model',
        'serial_number',
    )

    ordering = (
        'internal_code',
    )
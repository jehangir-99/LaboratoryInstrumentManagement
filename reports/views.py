from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from calibrations.models import Calibration
from instruments.models import Instrument
from locations.models import Location
from maintenance.models import Maintenance
from suppliers.models import Supplier


@login_required
def report_list(request):

    # =========================================================
    # INSTRUMENTS
    # =========================================================

    instruments = (
        Instrument.objects
        .select_related('location')
        .all()
        .order_by('internal_code')
    )

    total_instruments = instruments.count()

    in_service = Instrument.objects.filter(
        status='in_service'
    ).count()

    in_maintenance = Instrument.objects.filter(
        status='maintenance'
    ).count()

    out_of_service = Instrument.objects.filter(
        status='out_of_service'
    ).count()


    # =========================================================
    # SUPPLIERS
    # =========================================================

    total_suppliers = Supplier.objects.count()


    # =========================================================
    # LOCATIONS
    # =========================================================

    total_locations = Location.objects.count()


    # =========================================================
    # CALIBRATIONS
    # =========================================================

    total_calibrations = Calibration.objects.count()

    scheduled_calibrations = Calibration.objects.filter(
        status='scheduled'
    ).count()

    completed_calibrations = Calibration.objects.filter(
        status='completed'
    ).count()

    overdue_calibrations = Calibration.objects.filter(
        status='overdue'
    ).count()

    failed_calibrations = Calibration.objects.filter(
        status='failed'
    ).count()


    # =========================================================
    # MAINTENANCE
    # =========================================================

    total_maintenance = Maintenance.objects.count()

    preventive_maintenance = Maintenance.objects.filter(
        maintenance_type='preventive'
    ).count()

    corrective_maintenance = Maintenance.objects.filter(
        maintenance_type='corrective'
    ).count()


    # =========================================================
    # RECENT CALIBRATIONS
    # =========================================================

    recent_calibrations = (
        Calibration.objects
        .select_related('instrument')
        .order_by('-calibration_date')[:5]
    )


    # =========================================================
    # RECENT MAINTENANCE
    # =========================================================

    recent_maintenance = (
        Maintenance.objects
        .select_related('instrument')
        .order_by('-intervention_date')[:5]
    )


    # =========================================================
    # CONTEXT
    # =========================================================

    context = {

        # Instruments
        'instruments': instruments,
        'total_instruments': total_instruments,
        'in_service': in_service,
        'in_maintenance': in_maintenance,
        'out_of_service': out_of_service,

        # General
        'total_suppliers': total_suppliers,
        'total_locations': total_locations,

        # Calibrations
        'total_calibrations': total_calibrations,
        'scheduled_calibrations': scheduled_calibrations,
        'completed_calibrations': completed_calibrations,
        'overdue_calibrations': overdue_calibrations,
        'failed_calibrations': failed_calibrations,

        # Maintenance
        'total_maintenance': total_maintenance,
        'preventive_maintenance': preventive_maintenance,
        'corrective_maintenance': corrective_maintenance,

        # Recent records
        'recent_calibrations': recent_calibrations,
        'recent_maintenance': recent_maintenance,
    }


    return render(
        request,
        'reports/report_list.html',
        context
    )
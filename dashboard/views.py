from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from instruments.models import Instrument
from suppliers.models import Supplier
from locations.models import Location


@login_required
def dashboard(request):

    total_instruments = Instrument.objects.count()

    in_service = Instrument.objects.filter(
        status='in_service'
    ).count()

    in_maintenance = Instrument.objects.filter(
        status='maintenance'
    ).count()

    out_of_service = Instrument.objects.filter(
        status='out_of_service'
    ).count()

    total_suppliers = Supplier.objects.count()

    total_locations = Location.objects.count()

    recent_instruments = (
        Instrument.objects
        .select_related(
            'supplier',
            'location'
        )
        .order_by('-created_at')[:5]
    )

    context = {
        'current_user': request.user,

        'total_instruments': total_instruments,
        'in_service': in_service,
        'in_maintenance': in_maintenance,
        'out_of_service': out_of_service,

        'total_suppliers': total_suppliers,
        'total_locations': total_locations,

        'recent_instruments': recent_instruments,
    }

    return render(
        request,
        'dashboard/dashboard.html',
        context
    )
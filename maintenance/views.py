from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from accounts.decorators import role_required

from .forms import MaintenanceForm
from .models import Maintenance


@login_required
def maintenance_list(request):

    maintenance_records = Maintenance.objects.select_related(
        'instrument'
    ).all()

    query = request.GET.get('q', '').strip()
    maintenance_type = request.GET.get(
        'maintenance_type',
        ''
    ).strip()

    if query:
        maintenance_records = maintenance_records.filter(
            Q(instrument__internal_code__icontains=query)
            | Q(instrument__designation__icontains=query)
            | Q(responsible_technician__icontains=query)
            | Q(report__icontains=query)
            | Q(replaced_parts__icontains=query)
        )

    if maintenance_type:
        maintenance_records = maintenance_records.filter(
            maintenance_type=maintenance_type
        )

    context = {
        'maintenance_records': maintenance_records,
        'query': query,
        'selected_maintenance_type': maintenance_type,
        'maintenance_type_choices': (
            Maintenance.MAINTENANCE_TYPE_CHOICES
        ),
    }

    return render(
        request,
        'maintenance/maintenance_list.html',
        context
    )


@login_required
def maintenance_detail(request, pk):

    maintenance = get_object_or_404(
        Maintenance.objects.select_related(
            'instrument'
        ),
        pk=pk
    )

    return render(
        request,
        'maintenance/maintenance_detail.html',
        {
            'maintenance': maintenance
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def maintenance_create(request):

    if request.method == 'POST':

        form = MaintenanceForm(
            request.POST,
            request.FILES
        )

        if form.is_valid():

            maintenance = form.save()

            messages.success(
                request,
                'Maintenance record added successfully.'
            )

            return redirect(
                'maintenance:maintenance_detail',
                pk=maintenance.pk
            )

    else:

        form = MaintenanceForm()

    return render(
        request,
        'maintenance/maintenance_form.html',
        {
            'form': form
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def maintenance_update(request, pk):

    maintenance = get_object_or_404(
        Maintenance,
        pk=pk
    )

    if request.method == 'POST':

        form = MaintenanceForm(
            request.POST,
            request.FILES,
            instance=maintenance
        )

        if form.is_valid():

            maintenance = form.save()

            messages.success(
                request,
                'Maintenance record updated successfully.'
            )

            return redirect(
                'maintenance:maintenance_detail',
                pk=maintenance.pk
            )

    else:

        form = MaintenanceForm(
            instance=maintenance
        )

    return render(
        request,
        'maintenance/maintenance_form.html',
        {
            'form': form,
            'maintenance': maintenance
        }
    )


@login_required
@role_required('administrator')
def maintenance_delete(request, pk):

    maintenance = get_object_or_404(
        Maintenance,
        pk=pk
    )

    if request.method == 'POST':

        maintenance.delete()

        messages.success(
            request,
            'Maintenance record deleted successfully.'
        )

        return redirect(
            'maintenance:maintenance_list'
        )

    return render(
        request,
        'maintenance/maintenance_confirm_delete.html',
        {
            'maintenance': maintenance
        }
    )
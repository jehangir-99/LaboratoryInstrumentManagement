from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from accounts.decorators import role_required

from .forms import CalibrationForm
from .models import Calibration


@login_required
def calibration_list(request):

    calibrations = Calibration.objects.select_related(
        'instrument'
    ).all()

    query = request.GET.get('q', '').strip()
    status = request.GET.get('status', '').strip()

    if query:
        calibrations = calibrations.filter(
            Q(instrument__internal_code__icontains=query)
            | Q(instrument__designation__icontains=query)
            | Q(certificate_number__icontains=query)
            | Q(performed_by__icontains=query)
        )

    if status:
        calibrations = calibrations.filter(
            status=status
        )

    context = {
        'calibrations': calibrations,
        'query': query,
        'selected_status': status,
        'status_choices': Calibration.STATUS_CHOICES,
    }

    return render(
        request,
        'calibrations/calibration_list.html',
        context
    )


@login_required
def calibration_detail(request, pk):

    calibration = get_object_or_404(
        Calibration.objects.select_related(
            'instrument'
        ),
        pk=pk
    )

    return render(
        request,
        'calibrations/calibration_detail.html',
        {
            'calibration': calibration
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def calibration_create(request):

    if request.method == 'POST':

        form = CalibrationForm(request.POST)

        if form.is_valid():

            calibration = form.save()

            messages.success(
                request,
                'Calibration record added successfully.'
            )

            return redirect(
                'calibrations:calibration_detail',
                pk=calibration.pk
            )

    else:

        form = CalibrationForm()

    return render(
        request,
        'calibrations/calibration_form.html',
        {
            'form': form
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def calibration_update(request, pk):

    calibration = get_object_or_404(
        Calibration,
        pk=pk
    )

    if request.method == 'POST':

        form = CalibrationForm(
            request.POST,
            instance=calibration
        )

        if form.is_valid():

            calibration = form.save()

            messages.success(
                request,
                'Calibration record updated successfully.'
            )

            return redirect(
                'calibrations:calibration_detail',
                pk=calibration.pk
            )

    else:

        form = CalibrationForm(
            instance=calibration
        )

    return render(
        request,
        'calibrations/calibration_form.html',
        {
            'form': form,
            'calibration': calibration
        }
    )


@login_required
@role_required('administrator')
def calibration_delete(request, pk):

    calibration = get_object_or_404(
        Calibration,
        pk=pk
    )

    if request.method == 'POST':

        calibration.delete()

        messages.success(
            request,
            'Calibration record deleted successfully.'
        )

        return redirect(
            'calibrations:calibration_list'
        )

    return render(
        request,
        'calibrations/calibration_confirm_delete.html',
        {
            'calibration': calibration
        }
    )
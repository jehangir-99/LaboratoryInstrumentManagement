from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from accounts.decorators import role_required

from .forms import InstrumentForm
from .models import Instrument


@login_required
def instrument_list(request):

    instruments = Instrument.objects.select_related(
        'location',
        'supplier'
    ).all()

    query = request.GET.get('q', '').strip()
    status = request.GET.get('status', '').strip()

    if query:
        instruments = instruments.filter(
            Q(internal_code__icontains=query)
            | Q(designation__icontains=query)
            | Q(brand__icontains=query)
            | Q(model__icontains=query)
            | Q(serial_number__icontains=query)
        )

    if status:
        instruments = instruments.filter(
            status=status
        )

    context = {
        'instruments': instruments,
        'query': query,
        'selected_status': status,
        'status_choices': Instrument.STATUS_CHOICES,
    }

    return render(
        request,
        'instruments/instrument_list.html',
        context
    )


@login_required
def instrument_detail(request, pk):

    instrument = get_object_or_404(
        Instrument.objects.select_related(
            'location',
            'supplier'
        ),
        pk=pk
    )

    return render(
        request,
        'instruments/instrument_detail.html',
        {
            'instrument': instrument
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def instrument_create(request):

    if request.method == 'POST':

        form = InstrumentForm(
            request.POST,
            request.FILES
        )

        if form.is_valid():

            instrument = form.save()

            messages.success(
                request,
                'Instrument added successfully.'
            )

            return redirect(
                'instruments:instrument_detail',
                pk=instrument.pk
            )

    else:

        form = InstrumentForm()

    return render(
        request,
        'instruments/instrument_form.html',
        {
            'form': form
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def instrument_update(request, pk):

    instrument = get_object_or_404(
        Instrument,
        pk=pk
    )

    if request.method == 'POST':

        form = InstrumentForm(
            request.POST,
            request.FILES,
            instance=instrument
        )

        if form.is_valid():

            instrument = form.save()

            messages.success(
                request,
                'Instrument updated successfully.'
            )

            return redirect(
                'instruments:instrument_detail',
                pk=instrument.pk
            )

    else:

        form = InstrumentForm(
            instance=instrument
        )

    return render(
        request,
        'instruments/instrument_form.html',
        {
            'form': form,
            'instrument': instrument
        }
    )


@login_required
@role_required('administrator')
def instrument_delete(request, pk):

    instrument = get_object_or_404(
        Instrument,
        pk=pk
    )

    if request.method == 'POST':

        instrument.delete()

        messages.success(
            request,
            'Instrument deleted successfully.'
        )

        return redirect(
            'instruments:instrument_list'
        )

    return render(
        request,
        'instruments/instrument_confirm_delete.html',
        {
            'instrument': instrument
        }
    )
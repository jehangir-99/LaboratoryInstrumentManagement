from django import forms

from .models import Calibration


class CalibrationForm(forms.ModelForm):

    class Meta:
        model = Calibration

        fields = [
            'instrument',
            'calibration_date',
            'next_calibration_date',
            'status',
            'certificate_number',
            'performed_by',
            'remarks',
        ]

        widgets = {

            'instrument': forms.Select(attrs={
                'class': 'form-select',
            }),

            'calibration_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date',
                }
            ),

            'next_calibration_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date',
                }
            ),

            'status': forms.Select(attrs={
                'class': 'form-select',
            }),

            'certificate_number': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Certificate number',
            }),

            'performed_by': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Calibration organization / technician',
            }),

            'remarks': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Additional remarks',
            }),
        }
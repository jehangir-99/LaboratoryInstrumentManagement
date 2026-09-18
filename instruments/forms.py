from django import forms
from .models import Instrument


class InstrumentForm(forms.ModelForm):

    class Meta:
        model = Instrument

        fields = [
            'internal_code',
            'designation',
            'brand',
            'model',
            'serial_number',
            'location',
            'supplier',
            'purchase_date',
            'commissioning_date',
            'status',
            'photo',
        ]

        widgets = {

            'internal_code': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'e.g. INST-001'
                }
            ),

            'designation': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'e.g. Digital Balance'
                }
            ),

            'brand': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'Brand'
                }
            ),

            'model': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'Model'
                }
            ),

            'serial_number': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'Serial number'
                }
            ),

            'location': forms.Select(
                attrs={
                    'class': 'form-select'
                }
            ),

            'supplier': forms.Select(
                attrs={
                    'class': 'form-select'
                }
            ),

            'purchase_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'commissioning_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'status': forms.Select(
                attrs={
                    'class': 'form-select'
                }
            ),

            'photo': forms.ClearableFileInput(
                attrs={
                    'class': 'form-control'
                }
            ),
        }
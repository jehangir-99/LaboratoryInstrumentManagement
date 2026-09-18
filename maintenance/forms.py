from django import forms

from .models import Maintenance


class MaintenanceForm(forms.ModelForm):
    class Meta:
        model = Maintenance

        fields = [
            'instrument',
            'maintenance_type',
            'intervention_date',
            'responsible_technician',
            'report',
            'replaced_parts',
            'next_maintenance_date',
            'notes',
            'report_file',
        ]

        widgets = {
            'instrument': forms.Select(attrs={
                'class': 'form-select',
            }),
            'maintenance_type': forms.Select(attrs={
                'class': 'form-select',
            }),
            'intervention_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date',
                }
            ),
            'responsible_technician': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Technician / maintenance organization',
            }),
            'report': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Describe the maintenance work performed...',
            }),
            'replaced_parts': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'List replaced parts, if any...',
            }),
            'next_maintenance_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date',
                }
            ),
            'notes': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'Additional notes...',
            }),
            'report_file': forms.ClearableFileInput(attrs={
                'class': 'form-control',
            }),
        }
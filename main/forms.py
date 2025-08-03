from django import forms
from .models import ContactMessage

class ContactForm(forms.ModelForm):
    class Meta:
        model = ContactMessage
        fields = ['name', 'email', 'subject', 'message']
        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control rounded-pill px-4 py-2',
                'placeholder': 'Your Name',
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control rounded-pill px-4 py-2',
                'placeholder': 'Your Email',
            }),
            'subject': forms.TextInput(attrs={
                'class': 'form-control rounded-pill px-4 py-2',
                'placeholder': 'Subject',
            }),
            'message': forms.Textarea(attrs={
                'class': 'form-control px-4 py-2 rounded-4',
                'placeholder': 'Your Message',
                'rows': 5,
            }),
        }

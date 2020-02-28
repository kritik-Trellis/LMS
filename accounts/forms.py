from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm,UserChangeForm
from django.contrib.auth.models import User
from django import forms
from .models import *
from django.forms import ModelForm
import datetime

class createUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username','email','password1','password2']

class loginUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['email','password']

class DateInput(forms.DateInput):
    input_type = 'date'

class LeaveCreationForm(ModelForm):
	reason = forms.CharField(required=False, widget=forms.Textarea(attrs={'rows': 4, 'cols': 27})) ## 33 previous
	class Meta:
		model = Leave
		fields = ['startdate','enddate','leavetype','reason']
		widgets = {
            'startdate': DateInput(),
			'enddate' : DateInput()
        }

	def clean_enddate(self):
		enddate = self.cleaned_data['enddate']
		startdate = self.cleaned_data['startdate']
		today_date = datetime.date.today()

		if (startdate or enddate) < today_date:# both dates must not be in the past
			raise forms.ValidationError("You are not genius. You can not go back in time :p")

		elif startdate >= enddate:# TRUE -> FUTURE DATE > PAST DATE,FALSE other wise
			raise forms.ValidationError("Selected dates are wrong")

		return enddate



class EditProfileForm(forms.ModelForm):
    class Meta:
        model= Employee
        fields=(
        'firstname',
        'lastname',
        'email',
        'tel',
        'residence',
        'address',
        'reporting_to',
        'department',
        'role',


        )

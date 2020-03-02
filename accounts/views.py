from django.shortcuts import render , redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from django.template.loader import get_template
from django.core.mail import EmailMultiAlternatives

from .decorators import *
from .forms import *
# import jwt
from .models import *
from .manager import *
from django.contrib.auth.models import User
from .forms import *
from .decorators import *
from django.template.loader import get_template

def home(request):
    return render(request,'accounts/home.html')

@login_required(login_url='login')
@allowed_users(allowed_roles = ['admin','hr'])
def dashboard(request):
    return render(request,'accounts/dashboard.html')

@login_required(login_url='login')
@allowed_users(allowed_roles = ['employee'])
def user(request):
    employee = Employee.objects.filter(user=request.user).first()
    context = {'employee':employee}
    return render(request,'accounts/user.html',context)

@login_required(login_url='login')
@allowed_users(allowed_roles = ['manager'])
def manager(request):
    employee = Employee.objects.filter(user=request.user).first()
    leaves = Leave.objects.all_pending_leaves()
    context = {'employee':employee,'leave_count':len(leaves)}
    return render(request,'accounts/manager.html',context)

# @login_required(login_url='login')
# def submitleave(request):
#     context = {}
#     if request.method == "POST":
#         print(User.objects.filter(username=request.user).values_list('email',flat=True)[0])
#         print(type(User.objects.filter(username=request.user).values_list('email',flat=True)[0]))

#         employee = Employee.objects.get(Email_Address = User.objects.filter(username=request.user).values_list('email',flat=True)[0])
#         # empMgrDept = EmpMgrDept.objects.get(Emp_No_EmpMgrDept_id=employee)
#         # manager = Employee.objects.get(Emp_No=empMgrDept.Manager_Emp_ID_id)

#         # empleaverequest = EmpLeaveRequest(Emp_ID=employee, Emp_FullName=empMgrDept.Emp_FullName,
#         #                                   Leave_Type=request.POST['leavetype'],
#         #                                   Manager_Emp_No=manager, Manager_FullName=empMgrDept.Manager_FullName,
#         #                                   Begin_Date=request.POST['fromdate'],
#         #                                   End_Date=request.POST['todate'], Requested_Days=request.POST['requesteddays'],
#         #                                   Leave_Status="Pending", Emp_Comments=request.POST['comment'])
#         print(employee)
#     return render(request,'accounts/submitleave.html',context)

@unauthorized_user
def login_(request):

    form = loginUserForm()
    if request.method=="POST":


    # form = loginUserForm()
        if request.method == "POST":    

            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request,user)
                return redirect('dashboard')
            else:
                messages.info(request, message="Invalid credentials!")
                return render(request, 'accounts/login.html')
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('dashboard')
        else:
            messages.info(request, message="Invalid credentials!")
            return render(request, 'accounts/login.html')
    context = {}
    return render(request, 'accounts/login.html',context)


@unauthorized_user
def register(request):
    print('----------')
    form = createUserForm()
    if request.method == "POST":
        form = createUserForm(request.POST)
        # pass1=request.POST['password1']
        # pass2=request.POST['password2']
        # if pass1!=pass2:

        if form.is_valid():
            form.save()
            return redirect('login')
        else:
            # print(form.ValidationError)
            print(type(form.errors))
            messages.info(request, message="Invalid credentials!")
    context = {'form': form}
    return render(request, 'accounts/register.html', context)


def logout_(request):
    logout(request)
    return redirect('home')


def status(request):
    return HttpResponse("You are in status page")


@login_required(login_url='login')
def applyleave(request):
    if request.method == 'POST':
        form = LeaveCreationForm(request.POST)
        if form.is_valid():
            # import pdb;pdb.set_trace()
            instance = form.save(commit=False)
            user = request.user
            instance.user = user
            instance.save()
            print("LEAVE APPLIED SUCCESSFULLY!!!")
            print(request.POST['startdate'])
            print(request.POST['enddate'])

            # messages.success(request,"Submitted Successfully! Check <a href=\"{% url 'view_my_leave_table' %}\">STATUS</a>.")

            #Email functionality------------------------------------------------

            fname = User.objects.all().get(username=request.user).first_name
            lname = User.objects.all().get(username=request.user).last_name
            subject = "Leave Application | " + request.POST['leavetype'] + " | " + fname + " " + lname
            content = {'fname': fname, 'lname': lname,
                       'startdate': request.POST['startdate'], 'enddate': request.POST['enddate'],
                       'leavetype': request.POST['leavetype'], 'reason': request.POST['reason']
                       }
            html_body = get_template('accounts/email.html').render(content)
            bod = ""
            sent_by = "tejusgowda95@gmail.com"
            manage = Employee.objects.select_related().get(id=request.user.id).email
            print("=================================================")
            print(manage)
            print("=================================================")
            leave_applied_by = request.user.email
            ## hr group logic pending
            print("----", request.user)
            msg = EmailMultiAlternatives(subject=subject, from_email=sent_by,
                                         to=[leave_applied_by], body=bod)
            print("Sent to" + leave_applied_by)
            msg.attach_alternative(html_body, "text/html")
            msg.send()
            print("Mail sent successfully")
            #-----------------------------------------------------------------------------------------------

            return redirect('view_my_leave_table')
        messages.error(request, 'Failed to request a leave. Please check the dates')
        return redirect('applyleave')
    else:
        dataset = dict()
        form = LeaveCreationForm()
        employee= Employee.objects.filter(user = request.user).first()
        dataset['form'] = form
        dataset['title'] = 'Apply for Leave'
        context = {'form': form,
                   'dataset': dataset}
        return render(request, 'accounts/leave.html', context)



# @login_required(login_url='login')
# @allowed_users(allowed_roles = ['manager','hr'])
# def leaves_list(request):
# 	leaves = Leave.objects.all_pending_leaves()
# 	return render(request,'accounts/leaves_recent.html',{'leave_list':leaves,'title':'leaves list - pending'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['employee'])
def view_my_leave_table(request):
    user = request.user
    leaves = Leave.objects.filter(user=user)
    employee = Employee.objects.filter(user=user).first()
    print(leaves)
    context = {}
    dataset = dict()
    dataset['leave_list'] = leaves
    dataset['employee'] = employee
    dataset['title'] = 'Leaves List'
    context = {'dataset': dataset}
    print(dataset)
    print(context)
    return render(request, 'accounts/leave_status_employee.html', context)


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def leaves_list_mh(request):
    leaves = Leave.objects.all_pending_leaves()
    return render(request, 'accounts/leave_list_mh.html', {'leave_list': leaves, 'title': 'leaves list - pending'})


@login_required(login_url='login')
def leaves_view(request, id):
    leave = get_object_or_404(Leave, id=id)
    employee = Employee.objects.filter(user=leave.user)[0]
    print(employee)
    return render(request, 'accounts/leave_detail_view.html', {'leave': leave, 'employee': employee,
                                                               'title': '{0}-{1} leave'.format(leave.user.username,
                                                                                               leave.status)})


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def leaves_view_mh(request, id):
    leave = get_object_or_404(Leave, id=id)
    employee = Employee.objects.filter(user=leave.user)[0]
    print(employee)
    return render(request, 'accounts/leave_detail_view_mh.html', {'leave': leave, 'employee': employee,
                                                                  'title': '{0}-{1} leave'.format(leave.user.username,
                                                                                                  leave.status)})


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def approve_leave(request, id):
    leave = get_object_or_404(Leave, id=id)
    user = leave.user
    employee = Employee.objects.filter(user=user)[0]
    leave.approve_leave
    # messages.error(request,'Leave successfully approved for {0}'.format(employee.get_full_name),extra_tags = 'alert alert-success alert-dismissible show')
    return redirect('leaves_approved_list')


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def reject_leave(request, id):
    leave = get_object_or_404(Leave, id=id)
    leave.reject_leave
    # messages.success(request,'Leave is rejected',extra_tags = 'alert alert-success alert-dismissible show')
    return redirect('leave_rejected_list')


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def leaves_approved_list(request):
    leaves = Leave.objects.all_approved_leaves()  # approved leaves -> calling model manager method
    return render(request, 'accounts/all_leaves_approved.html', {'leave_list': leaves, 'title': 'approved leave list'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def leaves_rejected_list(request):
    leaves = Leave.objects.all_rejected_leaves()  # rejected leaves -> calling model manager method
    return render(request, 'accounts/all_leaves_rejected.html', {'leave_list': leaves, 'title': 'rejected leave list'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def unapprove_leave(request, id):
    leave = get_object_or_404(Leave, id=id)
    leave.unapprove_leave
    return redirect('leaves_list_mh')  # redirect to unapproved list



@login_required(login_url='login')
@allowed_users(allowed_roles=['manager', 'hr'])
def unreject_leave(request, id):
    leave = get_object_or_404(Leave, id=id)
    leave.status = 'pending'
    leave.is_approved = False
    leave.save()
    # messages.success(request,'Leave is now in pending list ',extra_tags = 'alert alert-success alert-dismissible show')
    return redirect('leaves_list_mh')

@login_required(login_url='login')
def edit_profile(request,id):

    obj= get_object_or_404(Employee,id=id)
    # if request.method=='POST':
    #     form=EditProfileForm(request.POST or None,request.FILES,instance=obj)
    #
    #     if form.is_valid():
    #         form.save()
    #         return redirect('/account/manager')
    #
    #
    # form=EditProfileForm(request.POST or None,request.FILES,instance=request.user)
    # print(form)
    # context={'form':form}
    # return render(request,'accounts/edit_profile.html',context)

    form = EditProfileForm(request.POST or None, instance= obj)
    context= {'form': form}

    if form.is_valid():
        obj= form.save(commit= False)

        obj.save()

        context= {'form': form}

        return redirect('user')

    else:
        context= {'form': form,
                   'error': 'The form was not updated successfully. Please enter in a title and content'}
        return render(request,'accounts/edit_profile.html',context)

	employee = get_object_or_404(Employee, id = id)
	if request.method == 'POST':
		form = EmployeeCreateForm(request.POST or None,request.FILES or None,instance = employee)
		if form.is_valid():
			instance = form.save(commit = False)

			user = request.POST.get('user')
			assigned_user = User.objects.get(id = user)

			instance.user = assigned_user

			instance.title = request.POST.get('title')
			instance.image = request.FILES.get('image')
			instance.firstname = request.POST.get('firstname')
			instance.lastname = request.POST.get('lastname')
			instance.othername = request.POST.get('othername')
			instance.sex = request.POST.get('sex')
			instance.bio = request.POST.get('bio')
			instance.birthday = request.POST.get('birthday')

			religion_id = request.POST.get('religion')
			religion = Religion.objects.get(id = religion_id)
			instance.religion = religion

			nationality_id = request.POST.get('nationality')
			nationality = Nationality.objects.get(id = nationality_id)
			instance.nationality = nationality

			department_id = request.POST.get('department')
			department = Department.objects.get(id = department_id)
			instance.department = department


			instance.hometown = request.POST.get('hometown')
			instance.region = request.POST.get('region')
			instance.residence = request.POST.get('residence')
			instance.address = request.POST.get('address')
			instance.education = request.POST.get('education')
			instance.lastwork = request.POST.get('lastwork')
			instance.position = request.POST.get('position')
			instance.ssnitnumber = request.POST.get('ssnitnumber')
			instance.tinnumber = request.POST.get('tinnumber')

			role = request.POST.get('role')
			role_instance = Role.objects.get(id = role)
			instance.role = role_instance

			instance.startdate = request.POST.get('startdate')
			instance.employeetype = request.POST.get('employeetype')
			instance.employeeid = request.POST.get('employeeid')
			instance.dateissued = request.POST.get('dateissued')

			# now = datetime.datetime.now()
			# instance.created = now
			# instance.updated = now

			instance.save()
			# messages.success(request,'Account Updated Successfully !!!',extra_tags = 'alert alert-success alert-dismissible show')
			return redirect('user')

		else:

			# messages.error(request,'Error Updating account',extra_tags = 'alert alert-warning alert-dismissible show')
			return HttpResponse("Form data not valid")

	dataset = dict()
	form = EmployeeCreateForm(request.POST or None,request.FILES or None,instance = employee)
	dataset['form'] = form
	dataset['title'] = 'edit - {0}'.format(employee.get_full_name)
	return render(request,'accounts/edit_profile.html',dataset)

# @login_required(login_url='login')
# def edit_profile(request,id):
#     obj= get_object_or_404(Employee,id=id)
#     # if request.method=='POST':
#     #     form=EditProfileForm(request.POST or None,request.FILES,instance=obj)
#     #
#     #     if form.is_valid():
#     #         form.save()
#     #         return redirect('/account/manager')
#     #
#     #
#     # form=EditProfileForm(request.POST or None,request.FILES,instance=request.user)
#     # print(form)
#     # context={'form':form}
#     # return render(request,'accounts/edit_profile.html',context)

#     form = EditProfileForm(request.POST or None, instance= obj)
#     context= {'form': form}

#     if form.is_valid():
#         obj= form.save(commit= False)

#         obj.save()

#         context= {'form': form}

#         return redirect('user')


#     context= {'form': form,
#                 'error': 'The form was not updated successfully. Please enter in a title and content'}
#     return render(request,'accounts/edit_profile.html',context)


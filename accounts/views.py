from django.shortcuts import render , redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import jwt
from .models import *
from .manager import *
from django.contrib.auth.models import User
from .forms import *
from .decorators import *

def home(request):
    return render(request,'accounts/home.html')

@login_required(login_url='login')
@allowed_users(allowed_roles = ['admin','hr'])
def dashboard(request):
    return render(request,'accounts/dashboard.html')

@login_required(login_url='login')
@allowed_users(allowed_roles = ['employee'])
def user(request):
    context = {}
    return render(request,'accounts/user.html')

@login_required(login_url='login')
@allowed_users(allowed_roles = ['manager','hr'])
def manager(request):
    context = {}
    return render(request,'accounts/manager.html')

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
    # form = loginUserForm()
    if request.method=="POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request,username=username,password=password)
        if user is not None:
            login(request,user)
            return redirect('dashboard')
        else:
            messages.info(request,message="Invalid credentials!")
            return render(request,'accounts/login.html')
    context = {}
    return render(request,'accounts/login.html',context)

@unauthorized_user
def register(request):
    form = createUserForm()
    if request.method=="POST":
        form = createUserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
        else:
            messages.info(request,message="Invalid credentials!")
    context = {'form':form}
    return render(request,'accounts/register.html',context)

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
            instance = form.save(commit = False)
            user = request.user
            instance.user = user
            instance.save()
            # print("LEAVE APPLIED SUCCESSFULLY!!!")
            # messages.success(request,"Submitted Successfully! Check <a href=\"{% url 'view_my_leave_table' %}\">STATUS</a>.")
            return redirect('view_my_leave_table')
        messages.error(request,'Failed to request a leave. Please check the dates')
        return redirect('applyleave')
    else:
        dataset = dict()
        form = LeaveCreationForm()
        dataset['form'] = form
        dataset['title'] = 'Apply for Leave'
        context = {'form':form,
                    'dataset':dataset}
        return render(request,'accounts/leave.html',context)

# @login_required(login_url='login')
# @allowed_users(allowed_roles = ['manager','hr'])
# def leaves_list(request):
# 	leaves = Leave.objects.all_pending_leaves()
# 	return render(request,'accounts/leaves_recent.html',{'leave_list':leaves,'title':'leaves list - pending'})


@login_required(login_url='login')
@allowed_users(allowed_roles = ['employee'])
def view_my_leave_table(request):
    user = request.user
    leaves = Leave.objects.filter(user = user)
    employee = Employee.objects.filter(user = user).first()
    print(leaves)
    context = {}
    dataset = dict()
    dataset['leave_list'] = leaves
    dataset['employee'] = employee
    dataset['title'] = 'Leaves List'
    context={'dataset':dataset}
    print(dataset)
    return render(request,'accounts/leave_status_employee.html',context)


@login_required(login_url='login')
@allowed_users(allowed_roles = ['manager','hr'])
def leaves_list_mh(request):
	leaves = Leave.objects.all_pending_leaves()
	return render(request,'accounts/leave_list_mh.html',{'leave_list':leaves,'title':'leaves list - pending'})

from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home,name="home"),
    path('dashboard/',views.dashboard,name="dashboard"),
    path('user/',views.user,name="user"),
    path('manager/',views.manager,name="manager"),
    path('status/',views.status,name="status"),
    path('leave/',views.applyleave,name="applyleave"),
    path('leave/view_status/',views.view_my_leave_table,name="view_my_leave_table"),
    path('leave/view_status_mh/',views.leaves_list_mh,name="leaves_list_mh"),
    path('leaves/view_status/view/<int:id>/',views.leaves_view,name="leaves_view"),
    path('leaves/view_status_mh/view/<int:id>/',views.leaves_view_mh,name="leaves_view_mh"),
    path('leaves/view_status_mh/view/<int:id>/approve/',views.approve_leave,name="approve_leave"),
    path('leaves/view_status_mh/view/<int:id>/reject/',views.reject_leave,name="reject_leave"),
    path('leaves/view/approved_leaves/',views.leaves_approved_list,name="leaves_approved_list"),
    path('leaves/view/rejected_leaves/',views.leaves_rejected_list,name="leave_rejected_list"),
    path('login/',views.login_,name="login"),
    path('register/',views.register,name="register"),
    path('logout/',views.logout_,name="logout")
    path('disapprove/<int:id>',views.disapprove,name="disapprove"),
    path('approve/<int:id>',views.approve,name="approve"),
]

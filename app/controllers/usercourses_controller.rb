class UsercoursesController < ApplicationController
  before_action :require_user_logged_in 
  
  def create
    course = Course.find(params[:course_id])
    current_user.attendcourse(course)
    flash[:success] = '受講しました。'
    redirect_to attends_course_path(course)
  end

  def destroy
    course = Course.find(params[:course_id])
    current_user.unattendcourse(course)
    flash[:success] = '受講を解除しました。'
    redirect_to course
  end
end

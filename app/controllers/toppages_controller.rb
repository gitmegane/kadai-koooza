class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @course = current_user.courses.build  # form_for 用
      #@courses = current_user.courses.order('created_at DESC').page(params[:page])
      #@courses = Course.all.page(params[:page])
    end
    @courses = Course.all.page(params[:page])
  end
end
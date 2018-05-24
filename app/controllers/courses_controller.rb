class CoursesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_course, only: [:update]
    
  def show
    @course = Course.find(params[:id])
    @user = @course.user
    @loginuser = current_user.name
  end
  
  def new
    @course = Course.new(major_no: 1, content: "")

  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    #binding.pry
    if @course.update(course_params)
      flash[:success] = '講座が正常に更新されました'
      redirect_to @course
    else
      flash.now[:danger] = '講座が更新されませんでした'
      render :edit
    end
  end
  
  
  def create
    @course = current_user.courses.build(major_no: '1', content: "",name: course_params[:name])
    #binding.pry
    if @course.save
      flash[:success] = '新規講座を作成しました。'
      #redirect_to root_url
      #redirect_to current_user
      redirect_to @course
    else
     # @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '新規講座の作成に失敗しました。'
      render 'toppages/index'
    end
  end
  
  private

  def set_course
    @course = current_user.courses.find(params[:id])
  end
  
  def course_params
    params.require(:course).permit(:name, :major_no , :content)
  end

end

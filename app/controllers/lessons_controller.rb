class LessonsController < ApplicationController
    
  def show
  end

  def new

  end

  def create
    #binding.pry
    @lesson = Course.find(params[:course_id]).lessons.build(lesson_params)
    if @lesson.save
      flash[:success] = '大項目が追加されました'
      #redirect_to edit_course_path
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = '大項目が追加されませんでした'
      render 'courses/edit'
    end
  end

  def update
    #binding.pry
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:success] = '講座が正常に更新されました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = '講座が更新されませんでした'
      render :edit
    end
  end
  
  private
  
  def lesson_params
    params.require(:lesson).permit(:major_no , :content, :image_url )
  end


end

class SchedulesController < ApplicationController
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def for_study
    @user = current_user
    @schedules = Schedule.all.paginate(page: params[:page], per_page: 3)
  end
  
  def for_study_new
    @schedule = Schedule.new
  end
  
  def for_study_create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = "Schedule created."
      redirect_to for_study_url
    else
      render 'for_study_new'
    end
  end
  
  def give
    #id = params[:id]
    user_params
  end
  
  private
  
    def user_params
      @user = User.find(params[:id])
      params.require(:user).permit(:id,:name,:email)
    end
    
    def schedule_params
      params.require(:schedule).permit(:title, :content, :overview, :date, :place)
    end
end

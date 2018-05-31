class SchedulesController < ApplicationController
  before_action :correct_user_for_schedule, only: [:edit, :update]
  
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      flash[:success] = "Schedule updated"
      redirect_to @schedule
    else
      render'edit'
    end
  end
  
  def for_study
    @user = current_user
    @schedules = Schedule.all.paginate(page: params[:page], per_page: 3)
    @schedules_t = Schedule.where(active_flag: true).paginate(page: params[:page], per_page: 3)
    @schedules_f = Schedule.where(active_flag: false).paginate(page: params[:page], per_page: 3)
  end
  
  def for_study_new
    @schedule = Schedule.new
  end
  
  def for_study_activated
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
      params.require(:schedule).permit(:title, :content, :overview, :date, :place, :target_value, :active_flag)
    end
    
    #beforeアクション
    def correct_user_for_schedule
      @schedule = Schedule.find(params[:id])
      @user = User.find(@schedule.user_id)
      redirect_to(root_url) unless current_user?(@user)
    end
end

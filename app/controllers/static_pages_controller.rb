class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def for_study
    @user = current_user
    @schedules = Schedule.all.paginate(page: params[:page])
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
      redirect_to for_study_url
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
      params.require(:schedule).permit(:title, :content)
    end
  
end


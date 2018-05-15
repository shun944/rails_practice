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
    
    @schedules = Schedule.all.paginate(page: params[:page])
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name,:email,:password,
                            :password_confirmation)
    end
  
end


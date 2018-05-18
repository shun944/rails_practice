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
  
  
  
  private
  
    def user_params
      @user = User.find(params[:id])
      params.require(:user).permit(:id,:name,:email)
    end
    
    def schedule_params
      params.require(:schedule).permit(:title, :content)
    end
  
end


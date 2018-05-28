class GoodsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @schedule = Schedule.find(params[:schedule_id])
    unless @schedule.iine?(current_user)
      @schedule.iine(current_user)
      @schedule.reload
      respond_to do |format|
        #require 'byebug'; byebug
        logger.debug(format)
        format.html { redirect_to request.referrer || root_url }
        #format.js
      end
    end
  end

  def destroy
    @schedule = Good.find(params[:id]).schedule
    if @schedule.iine?(current_user)
      @schedule.del_iine(current_user)
      @schedule.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        #format.js
      end
    end
  end
end

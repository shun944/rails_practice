class GoodsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @schedule.iine(current_user)
  end

  def destroy
    @schedule = Good.find(params[:id]).schedule
    @schedule.del_iine(current_user)
  end
end

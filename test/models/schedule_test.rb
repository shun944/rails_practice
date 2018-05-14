require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  def setup 
    @user = users(:michael)
    #↓要修正
    #@schedule = Schedule.new(content: "test", title: "title_test",
     #                     user_id: @user.id)
    @schedule = @user.schedules.build(content: "test", title: "title")
  end
  
  test "shoule be valid" do
    assert @schedule.valid?
  end
  
  test "user id should be present" do
    @schedule.user_id = nil
    assert_not @schedule.valid?
  end
  
  test "content should be at most 500 characters" do
    @schedule.content = "a" * 501
    assert_not @schedule.valid?
  end
  
  test "title should be at most 50 characters" do
    @schedule.title = "a" * 51
    assert_not @schedule.valid?
  end
  
  test "order should be most recent first" do
    assert_equal schedules(:zero), Schedule.first
  end
  
end


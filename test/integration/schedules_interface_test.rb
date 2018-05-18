require 'test_helper'

class SchedulesInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "schedule interface" do
    log_in_as(@user)
    get for_study_path
    assert_select 'div.pagination'
    #無効な送信
    assert_no_difference 'Schedule.count' do
      post for_study_create_path, params: { schedule: { title: "",
                                    content: "" } }
    end
    assert_select 'div#error_explanation'
  end
    
end

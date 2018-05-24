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
                                    content: "", overview: "" } }
    end
    assert_select 'div#error_explanation'
    #有効な送信
    title = "title"
    content = "test_content"
    overview = "test_overview"
    assert_difference 'Schedule.count', 1 do
      post for_study_create_path, params: { schedule: { title: title,
                                      content: content, overview: overview } }
    end
    assert_redirected_to for_study_url
    follow_redirect!
    assert_match content, response.body
  end
    
end

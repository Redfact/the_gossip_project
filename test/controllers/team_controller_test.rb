require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get teamView" do
    get team_teamView_url
    assert_response :success
  end

end

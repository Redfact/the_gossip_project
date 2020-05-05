require 'test_helper'

class AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get viewauthor" do
    get author_viewauthor_url
    assert_response :success
  end

end

require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contactView" do
    get contact_contactView_url
    assert_response :success
  end

end

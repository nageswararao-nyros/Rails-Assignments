require 'test_helper'

class SoftwarecompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get softwarecompany_index_url
    assert_response :success
  end

end

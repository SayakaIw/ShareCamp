require "test_helper"

class Admin::SiteCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_site_comments_destroy_url
    assert_response :success
  end
end

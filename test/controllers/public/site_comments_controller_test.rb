require "test_helper"

class Public::SiteCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_site_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_site_comments_destroy_url
    assert_response :success
  end
end

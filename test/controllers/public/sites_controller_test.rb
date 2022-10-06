require "test_helper"

class Public::SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_sites_show_url
    assert_response :success
  end

  test "should get new" do
    get public_sites_new_url
    assert_response :success
  end

  test "should get create" do
    get public_sites_create_url
    assert_response :success
  end

  test "should get index" do
    get public_sites_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_sites_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_sites_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_sites_destroy_url
    assert_response :success
  end
end

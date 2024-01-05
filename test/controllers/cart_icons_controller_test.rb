require "test_helper"

class CartIconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_icon = cart_icons(:one)
  end

  test "should get index" do
    get cart_icons_url, as: :json
    assert_response :success
  end

  test "should create cart_icon" do
    assert_difference("CartIcon.count") do
      post cart_icons_url, params: { cart_icon: { cart_id: @cart_icon.cart_id, item_id: @cart_icon.item_id, quantity: @cart_icon.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show cart_icon" do
    get cart_icon_url(@cart_icon), as: :json
    assert_response :success
  end

  test "should update cart_icon" do
    patch cart_icon_url(@cart_icon), params: { cart_icon: { cart_id: @cart_icon.cart_id, item_id: @cart_icon.item_id, quantity: @cart_icon.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy cart_icon" do
    assert_difference("CartIcon.count", -1) do
      delete cart_icon_url(@cart_icon), as: :json
    end

    assert_response :no_content
  end
end

require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test 'should get index' do
    get items_url, as: :json
    assert_response :success
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post items_url,
           params: { item: { category_id: @item.category_id, description: @item.description, image: @item.image, name: @item.name, price: @item.price, quantity: @item.quantity } }, as: :json
    end

    assert_response :created
  end

  test 'should show item' do
    get item_url(@item), as: :json
    assert_response :success
  end

  test 'should update item' do
    patch item_url(@item),
          params: { item: { category_id: @item.category_id, description: @item.description, image: @item.image, name: @item.name, price: @item.price, quantity: @item.quantity } }, as: :json
    assert_response :success
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete item_url(@item), as: :json
    end

    assert_response :no_content
  end
end

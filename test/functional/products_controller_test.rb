require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      :title        => 'Lorem Ipsum',
      :description  => 'Wibbles are fun!',
      :image_url    => 'lorem.jpg',
      :price        => 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select 'td.list_description', 3
    assert_select 'td.list_description dt', 'Programming Ruby 1.9'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product.to_param, :product => @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete :destroy, :id => products(:ruby).to_param
    end

    assert_redirected_to products_path
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end

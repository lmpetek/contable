require 'test_helper'

class CentroCostosControllerTest < ActionController::TestCase
  setup do
    @centro_costo = centro_costos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centro_costos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centro_costo" do
    assert_difference('CentroCosto.count') do
      post :create, :centro_costo => @centro_costo.attributes
    end

    assert_redirected_to centro_costo_path(assigns(:centro_costo))
  end

  test "should show centro_costo" do
    get :show, :id => @centro_costo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @centro_costo.to_param
    assert_response :success
  end

  test "should update centro_costo" do
    put :update, :id => @centro_costo.to_param, :centro_costo => @centro_costo.attributes
    assert_redirected_to centro_costo_path(assigns(:centro_costo))
  end

  test "should destroy centro_costo" do
    assert_difference('CentroCosto.count', -1) do
      delete :destroy, :id => @centro_costo.to_param
    end

    assert_redirected_to centro_costos_path
  end
end

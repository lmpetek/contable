require 'test_helper'

class EjerciciosControllerTest < ActionController::TestCase
  setup do
    @ejercicio = ejercicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ejercicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ejercicio" do
    assert_difference('Ejercicio.count') do
      post :create, :ejercicio => @ejercicio.attributes
    end

    assert_redirected_to ejercicio_path(assigns(:ejercicio))
  end

  test "should show ejercicio" do
    get :show, :id => @ejercicio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ejercicio.to_param
    assert_response :success
  end

  test "should update ejercicio" do
    put :update, :id => @ejercicio.to_param, :ejercicio => @ejercicio.attributes
    assert_redirected_to ejercicio_path(assigns(:ejercicio))
  end

  test "should destroy ejercicio" do
    assert_difference('Ejercicio.count', -1) do
      delete :destroy, :id => @ejercicio.to_param
    end

    assert_redirected_to ejercicios_path
  end
end

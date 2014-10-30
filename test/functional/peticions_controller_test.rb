require 'test_helper'

class PeticionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peticions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peticion" do
    assert_difference('Peticion.count') do
      post :create, :peticion => { }
    end

    assert_redirected_to peticion_path(assigns(:peticion))
  end

  test "should show peticion" do
    get :show, :id => peticions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => peticions(:one).to_param
    assert_response :success
  end

  test "should update peticion" do
    put :update, :id => peticions(:one).to_param, :peticion => { }
    assert_redirected_to peticion_path(assigns(:peticion))
  end

  test "should destroy peticion" do
    assert_difference('Peticion.count', -1) do
      delete :destroy, :id => peticions(:one).to_param
    end

    assert_redirected_to peticions_path
  end
end

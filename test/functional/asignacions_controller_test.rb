require 'test_helper'

class AsignacionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion" do
    assert_difference('Asignacion.count') do
      post :create, :asignacion => { }
    end

    assert_redirected_to asignacion_path(assigns(:asignacion))
  end

  test "should show asignacion" do
    get :show, :id => asignacions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asignacions(:one).to_param
    assert_response :success
  end

  test "should update asignacion" do
    put :update, :id => asignacions(:one).to_param, :asignacion => { }
    assert_redirected_to asignacion_path(assigns(:asignacion))
  end

  test "should destroy asignacion" do
    assert_difference('Asignacion.count', -1) do
      delete :destroy, :id => asignacions(:one).to_param
    end

    assert_redirected_to asignacions_path
  end
end

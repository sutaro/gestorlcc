require 'test_helper'

class TitulacionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titulacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create titulacion" do
    assert_difference('Titulacion.count') do
      post :create, :titulacion => { }
    end

    assert_redirected_to titulacion_path(assigns(:titulacion))
  end

  test "should show titulacion" do
    get :show, :id => titulacions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => titulacions(:one).to_param
    assert_response :success
  end

  test "should update titulacion" do
    put :update, :id => titulacions(:one).to_param, :titulacion => { }
    assert_redirected_to titulacion_path(assigns(:titulacion))
  end

  test "should destroy titulacion" do
    assert_difference('Titulacion.count', -1) do
      delete :destroy, :id => titulacions(:one).to_param
    end

    assert_redirected_to titulacions_path
  end
end

require 'test_helper'

class SolicitudrecursosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitudrecursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitudrecurso" do
    assert_difference('Solicitudrecurso.count') do
      post :create, :solicitudrecurso => { }
    end

    assert_redirected_to solicitudrecurso_path(assigns(:solicitudrecurso))
  end

  test "should show solicitudrecurso" do
    get :show, :id => solicitudrecursos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => solicitudrecursos(:one).to_param
    assert_response :success
  end

  test "should update solicitudrecurso" do
    put :update, :id => solicitudrecursos(:one).to_param, :solicitudrecurso => { }
    assert_redirected_to solicitudrecurso_path(assigns(:solicitudrecurso))
  end

  test "should destroy solicitudrecurso" do
    assert_difference('Solicitudrecurso.count', -1) do
      delete :destroy, :id => solicitudrecursos(:one).to_param
    end

    assert_redirected_to solicitudrecursos_path
  end
end

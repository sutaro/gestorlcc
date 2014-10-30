require 'test_helper'

class SolicitudlabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitudlabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitudlab" do
    assert_difference('Solicitudlab.count') do
      post :create, :solicitudlab => { }
    end

    assert_redirected_to solicitudlab_path(assigns(:solicitudlab))
  end

  test "should show solicitudlab" do
    get :show, :id => solicitudlabs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => solicitudlabs(:one).to_param
    assert_response :success
  end

  test "should update solicitudlab" do
    put :update, :id => solicitudlabs(:one).to_param, :solicitudlab => { }
    assert_redirected_to solicitudlab_path(assigns(:solicitudlab))
  end

  test "should destroy solicitudlab" do
    assert_difference('Solicitudlab.count', -1) do
      delete :destroy, :id => solicitudlabs(:one).to_param
    end

    assert_redirected_to solicitudlabs_path
  end
end

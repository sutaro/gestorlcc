require 'test_helper'

class PeticionlabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peticionlabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peticionlab" do
    assert_difference('Peticionlab.count') do
      post :create, :peticionlab => { }
    end

    assert_redirected_to peticionlab_path(assigns(:peticionlab))
  end

  test "should show peticionlab" do
    get :show, :id => peticionlabs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => peticionlabs(:one).to_param
    assert_response :success
  end

  test "should update peticionlab" do
    put :update, :id => peticionlabs(:one).to_param, :peticionlab => { }
    assert_redirected_to peticionlab_path(assigns(:peticionlab))
  end

  test "should destroy peticionlab" do
    assert_difference('Peticionlab.count', -1) do
      delete :destroy, :id => peticionlabs(:one).to_param
    end

    assert_redirected_to peticionlabs_path
  end
end

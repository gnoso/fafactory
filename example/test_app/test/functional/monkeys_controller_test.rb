require 'test_helper'

class MonkeysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monkeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monkey" do
    assert_difference('Monkey.count') do
      post :create, :monkey => { }
    end

    assert_redirected_to monkey_path(assigns(:monkey))
  end

  test "should show monkey" do
    get :show, :id => monkeys(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => monkeys(:one).to_param
    assert_response :success
  end

  test "should update monkey" do
    put :update, :id => monkeys(:one).to_param, :monkey => { }
    assert_redirected_to monkey_path(assigns(:monkey))
  end

  test "should destroy monkey" do
    assert_difference('Monkey.count', -1) do
      delete :destroy, :id => monkeys(:one).to_param
    end

    assert_redirected_to monkeys_path
  end
end

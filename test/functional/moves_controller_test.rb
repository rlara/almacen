require 'test_helper'

class MovesControllerTest < ActionController::TestCase
  setup do
    @move = moves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move" do
    assert_difference('Move.count') do
      post :create, move: { amount_d: @move.amount_d, amount_h: @move.amount_h, amount_s: @move.amount_s, date_move: @move.date_move, entry: @move.entry, existence: @move.existence, output: @move.output }
    end

    assert_redirected_to move_path(assigns(:move))
  end

  test "should show move" do
    get :show, id: @move
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @move
    assert_response :success
  end

  test "should update move" do
    put :update, id: @move, move: { amount_d: @move.amount_d, amount_h: @move.amount_h, amount_s: @move.amount_s, date_move: @move.date_move, entry: @move.entry, existence: @move.existence, output: @move.output }
    assert_redirected_to move_path(assigns(:move))
  end

  test "should destroy move" do
    assert_difference('Move.count', -1) do
      delete :destroy, id: @move
    end

    assert_redirected_to moves_path
  end
end

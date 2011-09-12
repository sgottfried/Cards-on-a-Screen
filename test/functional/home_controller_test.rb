require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should update position on card_moved" do
    get("cards_moved", {'id' => '980190962', 'top' => '5', 'left' => '5'})

    
    assert_equal(5, Card.find(980190962).left)
    assert_equal(5, Card.find(980190962).top)
    assert_response :success
  end

end

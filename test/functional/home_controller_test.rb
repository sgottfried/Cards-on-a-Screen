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

  test "should create card in DB and return card HTML on card_create" do
    assert_difference('Card.count') do
      get("card_create", {'top' => '50', 'left' => '50'})
    end
    
    assert_response :success

    assert_present css_select(".database_id").first.children.first.content
    assert response.body.include?("left: 50px; top: 50px")
  end


end

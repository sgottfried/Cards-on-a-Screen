require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should update position on card_moved' do
    get :cards_moved, {:id => 1, :top => 5, :left => 5}
    assert_equal(5, Card.find(1).left)
    assert_equal(5, Card.find(1).top)
    assert_response :success
  end

  test 'should create card in DB and return card HTML on card_create' do
    assert_difference('Card.count') do
      get :card_create, {:top => 50, :left => 50, :background_color => :white}
    end
    
    assert_response :success

    assert_present css_select(".database_id").first.children.first.content
    assert response.body.include?("background-color:white; left: 50px; top: 50px"), 
      "We should have created a white card at position left:50px, top:50px."
  end

  test 'should update text and return it on card_text' do
    get :card_text, {:id => 1, 'text' => 'updated text'}

    assert_response :success
    assert_equal 'updated text', Card.find(1).text
    assert_equal 'updated text', response.body
  end
  
  test 'should delete card' do
    get :card_delete, {:id => 2}
    assert_response :success
    card = Card.find(2)
    assert card.trashed, 'If card is deleted, it should end up in the trash.'
  end

  test 'should get all trash' do
    get :all_trash
    assert_response :success

    cards = JSON.parse @response.body
    assert cards.size == 1
  end

  test 'should restore card' do
    get :card_restore, {:id => 3}
    assert_response :success
    card = Card.find(3)
    assert_false card.trashed?, 'If a card is restored, it should not be trashed.'
  end
end

class HomeController < ApplicationController
  def index
    @cards = Card.all
  end

  def cards_moved
    card = Card.find_by_id(params[:id])
    card.left = params[:left]
    card.top = params[:top]
    card.save!
    
    render :nothing => true
  end
  
  def card_create
    card = Card.new
    card.left = params[:left]
    card.top = params[:top]
    card.text = "New card"
    card.save!
    render :partial => "card", :object => card
  end
  
  def card_text
    card = Card.find_by_id(params[:id])
    card.text = params[:text]
    card.save!
    
    render :text => card.text
  end
end

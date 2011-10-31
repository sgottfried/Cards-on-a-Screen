class HomeController < ApplicationController
  def index
    @cards = Card.select {|c| c unless c.trashed}
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
    card.background_color = params[:background_color]
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
  
  def card_delete
    card = Card.find_by_id(params[:id])
    card.trashed = true
    card.save
    render :nothing => true
  end

  def all_trash
    cards = Card.select {|c| c if c.trashed}

    render :json => cards
  end

  def card_restore
    card = Card.find_by_id(params[:id])
    card.trashed = false
    card.save
    render :nothing => true
  end
end

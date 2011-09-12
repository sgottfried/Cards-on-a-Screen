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
  
  
end

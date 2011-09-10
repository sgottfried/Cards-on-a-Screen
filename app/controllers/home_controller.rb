class HomeController < ApplicationController
  def index
    @cards = Card.all
  end

  def cards_moved
    render :nothing => true
  end
end

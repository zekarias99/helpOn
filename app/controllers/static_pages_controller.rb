class StaticPagesController < ApplicationController
  def home
    @deals = Deal.order(:name)
  end

  def help
  end

  def about    
  end

  def how_it_works    
  end

  def contact  
  end
end
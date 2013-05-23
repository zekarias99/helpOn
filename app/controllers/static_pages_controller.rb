class StaticPagesController < ApplicationController
  def home 
    @deals = Deal.featured_date
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
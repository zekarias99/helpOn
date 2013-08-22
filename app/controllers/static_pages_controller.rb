class StaticPagesController < ApplicationController

  def home
    @status = current_user.statuses.build if signed_in?
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
class LineItem < ActiveRecord::Base

  belongs_to :deal
  belongs_to :cart

  def total_price
  	deal.current_price * quantity
  end

  def charity_get
  	(total_price) *0.1
  end
end

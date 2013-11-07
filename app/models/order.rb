class Order < ActiveRecord::Base
	validates :cardholder_name, :billing_address, :card_number,:city, :state,
	          :security_code, :postal_code, :expiration_date, presence: true

  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Visa", "Master", "Pay Pal" ]

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end
  end
end

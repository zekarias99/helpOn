class LineItem < ActiveRecord::Base
  belongs_to :deal
  belongs_to :cart
end

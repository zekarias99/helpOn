class Highlight < ActiveRecord::Base
  validates :description, :deal_id, presence: true
  belongs_to :deal
end

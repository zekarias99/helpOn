class FinePrint < ActiveRecord::Base
  validates :description,  presence: true
  belongs_to :deal
end

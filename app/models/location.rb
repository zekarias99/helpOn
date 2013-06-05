class Location < ActiveRecord::Base
  validates :name, :zip_code, :presence => true
end

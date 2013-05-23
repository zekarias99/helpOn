class Deal < ActiveRecord::Base
  def self.featured_date
    where("deal_date >= ?", Time.now).order("deal_date")
  end
end
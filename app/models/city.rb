class City < ActiveRecord::Base
  
  validates :name,  :presence => true,
                    :uniqueness => true
                    
  belongs_to :state
  
  before_save :create_search_name
  
  def create_search_name
    self.search_name = self.name.downcase.gsub(/ /,'')
  end
end

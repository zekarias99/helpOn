
class Deal < ActiveRecord::Base

  validates :regular_price, :initial_discount, :deal_date, :blurb,
            :max_discount, :max_threshold, :blurb_title, :deal_type,
            :tipping_point, :end_date, :approved, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :regular_price, :initial_discount, :max_threshold, :max_discount, 
             numericality: { greater_than_or_equal_to: 0.01 }

  validates :photo_file_name, allow_blank: true, format: 
           {with: /\w+.(gif|jpg|png)\z/i,
            message: "must reference a GIF, JPG, or PNG image" }
            
  has_many :fine_prints, :dependent => :destroy
  has_many :highlights, :dependent => :destroy

  DEAL_TYPE = %w[Flat Slider Tipping]
            
  def self.featured_date
    where("deal_date >= ?", Time.now).order("deal_date")
  end

 def order_count
    counted = 25
    if self.deal_type == 'Slider'
      counted < self.max_threshold ? counted : self.max_threshold
    else
      counted
    end
  end
  
  def ordered_percent
    ((self.order_count/self.tipping_point.to_f)*100).to_i
  end
  
  def orders_to_go
    self.tipping_point - self.order_count
  end
  
  def initial_discount_price
    self.regular_price-(self.regular_price*(self.initial_discount.to_f/100))
  end
  
  def max_discount_price
    self.regular_price-(self.regular_price*(self.max_discount.to_f/100))
  end
  
  def each_discount
    (self.initial_discount_price-self.max_discount_price)/self.max_threshold
  end
  
  def current_price
    self.initial_discount_price-(self.order_count*self.each_discount)
  end
  
  def discount_percent
    (1-(self.current_price/self.regular_price.to_f))*100
  end
  
  def savings
    self.regular_price-self.current_price
  end
  
  def flat_savings
    self.regular_price*(self.initial_discount.to_f/100)
  end
end

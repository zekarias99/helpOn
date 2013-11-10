class Deal < ActiveRecord::Base

  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :photo, 
     :content_type => { :content_type => /\w+.(gif|jpg|png)\z/i },
     :message => { :message => "must reference a GIF, JPG, or PNG image" }


  validates :regular_price, :initial_discount, :deal_date, :blurb,
            :max_discount, :max_threshold, :blurb_title, :deal_type,
            :tipping_point, :end_date, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :regular_price, :deal_price, :initial_discount, :max_threshold, :max_discount, 
             numericality: { greater_than_or_equal_to: 0.01 }

  # validates :photo, allow_blank: true, format: 
  #          {with: /\w+.(gif|jpg|png)\z/i,
  #           message: "must reference a GIF, JPG, or PNG image" }

  DEAL_TYPE = %w[Flat Slider Tipping]

  # # accepts_nested_attributes_for :fine_prints, :reject_if => lambda { |a| a[:description].blank? }
  # accepts_nested_attributes_for :highlights, :reject_if => lambda { |a| a[:description].blank? }
  
  has_many :users_deals
  has_many :users, :through => :users_deals
  belongs_to :company
  belongs_to :city
  has_many :line_items

  has_many :fine_prints, :dependent => :destroy
  has_many :highlights, :dependent => :destroy
  has_many :orders, through: :line_items

            
  # def self.featured_date
  #   where("deal_date >= ?", Time.now).order("deal_date")
  # end

  def self.latest
    Deal.order(:updated_at).last
  end
  
  after_update :remove_empty_fine_prints
  after_update :remove_empty_highlights

  def remove_empty_fine_prints
    fine_prints.delete fine_prints.select{ |fine_print| fine_print.description.blank?}
  end
  
  def remove_empty_highlights
    highlights.delete highlights.select{ |highlight| highlight.description.blank?}
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
  def your_charity_get
    (flat_savings)*0.1
  end

  def charity_get
    (current_price.to_f)*0.1
  end

  private
      # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item 
    if line_items.empty?
      return true 
     else
       errors.add(:base, 'Line Items present')
       return false 
     end
  end
end

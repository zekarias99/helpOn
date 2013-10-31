class Company < ActiveRecord::Base

  validates :business_name,:address_1, :state, :zip, :pick_a_category,
            :country, :phone, :where_do_you_want_your_helpon_to_run,
             presence: true
  validates :tell_us_a_little_bit_about_your_business, length: { maximum: 500 }

  validates :user_id, presence: true

  default_scope -> { order('companies.created_at DESC') }
  

  belongs_to :city
  has_many   :deals

  # PICK_A_CATEGORY_OPTIONS = [ 
  #   'Food & Drink',
  #   'Events & Activities',
  #   'Beauty & Spa',
  #   'Fitness, Health & Wellness',
  #   'Home & Auto',
  #   'Other'
  # ]

  # validates :pick_a_category, inclusion: { in: PICK_A_CATEGORY_OPTIONS }
end







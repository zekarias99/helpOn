class Company < ActiveRecord::Base

  before_save { self.email_address = email_address.downcase } 
  validates :business_name, :email_address, :first_name, :last_name,
            :address_1, :state, :zip, :pick_a_category,
            :country, :phone, :where_do_you_want_your_helpon_to_run,
             presence: true
  validates :tell_us_a_little_bit_about_your_business, length: { maximum: 500 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  belongs_to :city
  belongs_to :deal

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







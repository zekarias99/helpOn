class Company < ActiveRecord::Base
  validates :business_name, :email_address, :first_name, :last_name,
            :address_1, :city_id, :state, :zip,:pick_a_category,
            :country, :phone, :where_do_you_want_your_helpon_to_run,
            :tell_us_a_little_bit_about_your_business, presence: true
  belongs_to :deal
end
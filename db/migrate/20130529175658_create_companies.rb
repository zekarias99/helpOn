class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :business_name
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :website
      t.string :pick_a_category
      t.string :where_do_you_want_your_helpon_to_run
      t.string :review_links
      t.string :tell_us_a_little_bit_about_your_business

      t.timestamps
    end
  end
end

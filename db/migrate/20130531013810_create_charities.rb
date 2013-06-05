class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :charity_name
      t.string :registered_charity_number
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :email_address
      t.integer :telephone_number
      t.boolean :i_agree_to_the
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :state
      t.integer :zip
      t.string :country
      t.string :website
      t.string :pick_a_category
      t.references :city, index: true      
      t.timestamps
    end
  end
end

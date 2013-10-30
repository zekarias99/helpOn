require 'spec_helper'

describe Charity do

  let(:user) { FactoryGirl.create(:user) }
  
  before do
  	@charity = user.charities.build(charity_name: "UNHCR",  
  		                            registered_charity_number: 111048 , 
                                  i_agree_to_the: true,
                                  description: "Human Right",
                                  address_1: "3022 NE 140th St",
                                  address_2: "3022 NE 140th St",
                                  state: "Seattle",
                                  zip: "98125",
                                  country: "USA",
                                  website: "unhcr.org",
                                  pick_a_category: "International",
                                  city: "Seattle",
                                  goal_amount: "2000",
                                  raising_ends_on: "Fri, 25 Oct 2013", 
                                  user_id: user.id)
  end

   subject { @charity }

   it { should respond_to(:charity_name) }
   it { should respond_to(:registered_charity_number) }
   it { should respond_to(:i_agree_to_the) }
   it { should respond_to(:description) }
   it { should respond_to(:address_1) }
   it { should respond_to(:address_2) }
   it { should respond_to(:state) }
   it { should respond_to(:zip) }
   it { should respond_to(:country) }
   it { should respond_to(:website) }
   it { should respond_to(:pick_a_category) }
   it { should respond_to(:city) }
   it { should respond_to(:goal_amount) }
   it { should respond_to(:raising_ends_on) }
   it { should respond_to(:amount_raised) }
   its(:user) { should ==user }

   it { should be_valid }

   describe "when I agree to the... is not present" do
   	before { @charity.i_agree_to_the = nil }
   	it { should_not be_valid }
   end

   describe "when description is not present" do
   	before { @charity.description = nil }
   	it { should_not be_valid }
   end

   describe "when address 1 is not present" do
   	before { @charity.address_1 = nil }
   	it { should_not be_valid }
   end

   describe "when state is not present" do
   	before { @charity.state = nil }
   	it { should_not be_valid }
   end

   describe "when zip is not present" do
   	before { @charity.zip = nil }
   	it { should_not be_valid }
   end

   describe "when city is not present" do
    before { @charity.city = nil }
    it { should_not be_valid }
   end

   describe "when country is not present" do
   	before { @charity.country = nil }
   	it { should_not be_valid }
   end

   describe "when website is not present" do
   	before { @charity.website = nil }
   	it { should_not be_valid }
   end

   describe "when pick a category is not present" do
   	before { @charity.pick_a_category = nil }
   	it { should_not be_valid }
   end

   describe "when charity name is to long" do
   	before { @charity.charity_name = "a" * 51}
   	it { should_not be_valid }
   end

  describe "when description is too long" do
  	before { @charity.description = "a" * 501 }
  	it { should_not be_valid } 	
  end

  describe "when raising ends on is not present" do
    before { @charity.raising_ends_on = nil }
    it { should_not be_valid }
  end

  describe "when goal amount is not present" do
    before { @charity.goal_amount = nil }
    it { should_not be_valid }
  end
end






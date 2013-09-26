require 'spec_helper'

describe Charity do

  let(:user) { FactoryGirl.create(:user) }
  
  before do
  	@charity = user.charities.build(charity_name: "UNHCR",  
  		                          registered_charity_number: "111048", 
                                  first_name: "Foo", last_name: "Bar",  
                                  job_title: "Manager", 
                                  email_address: "manager@unhcr.gov",
                                  telephone_number: "111048",
                                  i_agree_to_the: true,
                                  description: "Human Right",
                                  address_1: "3022 NE 140th St",
                                  address_2: "3022 NE 140th St",
                                  state: "Seattle",
                                  zip: "98125",
                                  country: "USA",
                                  website: "unhcr.org",
                                  pick_a_category: "International",
                                  city_id: "1", user_id: user.id)
  end

   subject { @charity }

   it { should respond_to(:charity_name) }
   it { should respond_to(:registered_charity_number) }
   it { should respond_to(:first_name) }
   it { should respond_to(:last_name) }
   it { should respond_to(:job_title) }
   it { should respond_to(:email_address) }
   it { should respond_to(:telephone_number) }
   it { should respond_to(:i_agree_to_the) }
   it { should respond_to(:description) }
   it { should respond_to(:address_1) }
   it { should respond_to(:address_2) }
   it { should respond_to(:state) }
   it { should respond_to(:zip) }
   it { should respond_to(:country) }
   it { should respond_to(:website) }
   it { should respond_to(:pick_a_category) }
   it { should respond_to(:city_id) }
   its(:user) { should ==user }

   it { should be_valid }

   describe "when charity name is not present" do
   	before { @charity.user_id = nil }
   	it { should_not be_valid }
   end

   describe "when first name is not present" do
   	before { @charity.first_name = nil }
   	it { should_not be_valid }
   end

   describe "when last name is not present" do
   	before { @charity.last_name = nil }
   	it { should_not be_valid }
   end

   describe "when job job title is not present" do
   	before { @charity.job_title = nil }
   	it { should_not be_valid }
   end

   describe "when email address is not present" do
   	before { @charity.email_address = nil }
   	it { should_not be_valid }
   end

   describe "when telephone_number is not present" do
   	before { @charity.telephone_number = nil }
   	it { should_not be_valid }
   end

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

   describe "when email address format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @charity.email_address = invalid_address
        expect(@charity).to_not be_valid
      end
    end
  end

  describe "when email address format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.las@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @charity.email_address = valid_address
        expect(@charity).to be_valid
      end
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMple.com" }
    
    it "it should be saved as all lower-case" do
      @charity.email_address = mixed_case_email
      @charity.save
      expect(@charity.reload.email_address).to eq mixed_case_email.downcase
    end
  end

  describe "when description is too long" do
  	before { @charity.description = "a" * 501 }
  	it { should_not be_valid } 	
  end
end






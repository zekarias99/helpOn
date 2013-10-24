require 'spec_helper'

describe Company do

  let(:user) { FactoryGirl.create(:user) }
 
 before do
   @company = user.companies.build(business_name: "Wanza Bar", address_1: "Keftegna 2",
                            address_2: "Kebele 2", state: "Dekemhare", 
                            zip: "111048",pick_a_category: "Bar", 
                            country: "Eritrea", phone: "111048", 
                            where_do_you_want_your_helpon_to_run: "Dekemhare", 
                            review_links: "http://example.com", website: "https://example")
 end

  subject { @company }

  it { should respond_to(:business_name) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:website) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:pick_a_category) }
  it { should respond_to(:country) }
  it { should respond_to(:phone) }
  it { should respond_to(:review_links) }
  it { should respond_to(:where_do_you_want_your_helpon_to_run) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  

  it { should be_valid }

  describe "when business name is not present" do
    before { @company.business_name = " " }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @company.user_id = nil }
    it { should_not be_valid }
  end

  describe "when address 1 is not present" do
    before { @company.address_1 = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @company.state = nil }
    it { should_not be_valid }
  end

  describe "when zip is not present" do
    before { @company.zip = " " }
    it { should_not be_valid }
  end

  describe "when country is not present" do
    before { @company.country = " " }
    it { should_not be_valid }
  end

  describe "when phone is not present" do
    before { @company.phone = " " }
    it { should_not be_valid }
  end


  describe "when pick a catagory is not present" do
    before { @company.pick_a_category = " " }
    it { should_not be_valid }
  end

  describe "when where do you want your helpon to run is not present" do
    before { @company.where_do_you_want_your_helpon_to_run = " " }
    it { should_not be_valid }
  end


  describe "when tell us a little bit about your business is not present" do
    before { @company.pick_a_category = " " }
    it { should_not be_valid }
  end

  describe " when business description  that is too long" do
    before { @company.tell_us_a_little_bit_about_your_business = "a" * 501 }
    it { should_not be_valid }
  end  


  it "valid business name should be valid"
  it "invalid business name should not be valid"
  it "valid first name should be valid"
  it "invalid first name should not be valid"
  it "valid last name should be valid"
  it "invalid last name should not be valid"
  it "valid review links should be valid"
  it "invalid review links should not be valid"
  it "valid website URL should be valid"
  it "invalid website URL should not be valid"
end
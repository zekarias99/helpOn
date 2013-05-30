require 'spec_helper'

describe Company do

  before { @company = Company.new(company_attributes) }

  subject { @company }

  describe "when business name is not present" do
    before { @company.business_name = " " }
    it { should_not be_valid }
  end

  describe "when email address is not present" do
    before { @company.email_address = " " }
    it { should_not be_valid }
  end

  describe "when first name is not present" do
    before { @company.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @company.last_name = " " }
    it { should_not be_valid }
  end

  describe "when address 1 is not present" do
    before { @company.address_1 = " " }
    it { should_not be_valid }
  end

  describe "when address 2 is not present" do
    before { @company.address_2 = " " }
    it { should be_valid }
  end

  describe "when city id is not present" do
    before { @company.city_id = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @company.state = " " }
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

  describe "when website is not present" do
    before { @company.website = " " }
    it { should be_valid }
  end

  describe "when pick a catagory is not present" do
    before { @company.pick_a_category = " " }
    it { should_not be_valid }
  end

  describe "when where do you want your helpon to run is not present" do
    before { @company.where_do_you_want_your_helpon_to_run = " " }
    it { should_not be_valid }
  end

  describe "when review links is not present" do
    before { @company.review_links = " " }
    it { should be_valid }
  end

  describe "when tell us a little bit about your business is not present" do
    before { @company.pick_a_category = " " }
    it { should_not be_valid }
  end

  it "an valid e-mail should_not valid"
  it "valid e-mail should be valid"
end
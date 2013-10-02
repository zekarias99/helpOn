require 'spec_helper'

describe Company do
 
 before do
   @company = Company.new(company_attributes)
 end

  subject { @company }

  it { should respond_to(:business_name) }
  it { should respond_to(:email_address) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:address_1) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:pick_a_category) }
  it { should respond_to(:country) }
  it { should respond_to(:phone) }
  it { should respond_to(:where_do_you_want_your_helpon_to_run) }
  

  it { should be_valid }

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

  describe "when email address format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @company.email_address = invalid_address
        expect(@company).to_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.las@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @company.email_address = valid_address
        expect(@company).to be_valid
      end
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMple.com" }
    
    it "it should be saved as all lower-case" do
      @company.email_address = mixed_case_email
      @company.save
      expect(@company.reload.email_address).to eq mixed_case_email.downcase
    end
  end

  describe "when website URL is valid" do
    it "should be valid" do
      sites = %w[http://example.com https://example]
      sites.each do |valid_site|
        @company.website = valid_site
        expect(@company).to be_valid
      end
    end
  end

  describe "when website URL is invalid" do
    it "should be invalid" do
      sites = %w[example.com http examplehttp]
      sites.each do |invalid_site|
        @company.website = invalid_site

        expect(@company).to_not be_valid
        expect(@company.errors[:website].any?).to be_true
      end
    end
  end  
  it "valid business name should be valid"
  it "invalid business name should be valid"
  it "valid first name should be valid"
  it "invalid first name should be valid"
  it "valid last name should be valid"
  it "invalid last name should be valid"
end
require 'spec_helper'

describe Deal do

  before { @deal = Deal.new(deal_attributes) }

  subject { @deal }

  describe "when deal name is not present" do
    before { @deal.name = " " }
    it { should_not be_valid }
  end

  describe "when regular_price is not present" do
    before { @deal.regular_price = " " }
    it { should_not be_valid }
  end

  describe "when initial_discount is not present" do
    before { @deal.initial_discount = " " }
    it { should_not be_valid }
  end

  describe "when max_discount is not present" do
    before { @deal.max_discount = " " }
    it { should_not be_valid }
  end

  describe "when max_threshold is not present" do
    before { @deal.max_threshold = " " }
    it { should_not be_valid }
  end

  describe "when approved is not present" do
    before { @deal.approved = " " }
    it { should_not be_valid }
  end

  describe "when deal_date is not present" do
    before { @deal.deal_date = " " }
    it { should_not be_valid }
  end

  describe "when photo_file_name is not present" do
    before { @deal.photo_file_name = " " }
    it { should_not be_valid }
  end

  describe "when blurb_title is not present" do
    before { @deal.blurb_title = " " }
    it { should_not be_valid }
  end

  describe "when blurb is not present" do
    before { @deal.blurb = " " }
    it { should_not be_valid }
  end

  describe "when deal_type is not present" do
    before { @deal.deal_type = " " }
    it { should_not be_valid }
  end

  describe "when tipping_point is not present" do
    before { @deal.tipping_point = " " }
    it { should_not be_valid }
  end

  describe "when end_date is not present" do
    before { @deal.end_date = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @deal.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when deal name is already taken" do
    before do
      deal_with_same_name = @deal.dup
      deal_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when deal name is already taken" do
    before do
      deal_with_same_name = @deal.dup
      deal_with_same_name.name = @deal.name.upcase
      deal_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "regular price should not <= $0." do
    before { @deal.regular_price <= 0 }
    it { should_not be_valid }
  end

  describe "max discount should not <= $0." do
    before { @deal.max_discount <= 0 }
    it { should_not be_valid }
  end

  describe "initial discount should not <= $0." do
    before { @deal.initial_discount <= 0 }
    it { should_not be_valid }
  end

  describe "max threshold should not <= $0." do
    before { @deal.max_threshold <= 0 }
    it { should_not be_valid }
  end

  describe "accepts properly formatted image file names" do
    it "should be valid" do
     @deal.name = "Proper image deal" 
    file_names = %w[e.png event.png event.jpg event.gif EVENT.GIF]
    file_names.each do |accepted_file_name|
        @deal.photo_file_name = accepted_file_name
        expect(@deal).to be_valid
      end      
    end
  end

  describe "rejects improperly formatted image file names" do
    it "shouldn't be valid" do
     @deal.name = "An proper image deal" 
    file_names = %w[event .jpg .png .gif event.pdf event.doc]
    file_names.each do |an_accepted_file_name|
        @deal.photo_file_name = an_accepted_file_name
        expect(@deal).not_to be_valid
      end      
    end
  end

  it "Shows the flat savings on the deals/show page"
end
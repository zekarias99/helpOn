require 'spec_helper'

describe Deal do

  before { @deal = Deal.new(deal_attributes) }

  subject { @deal }

  it { should respond_to(:name) }
  it { should respond_to(:regular_price) }
  it { should respond_to(:initial_discount) }
  it { should respond_to(:max_discount) }
  it { should respond_to(:max_threshold) }
  it { should respond_to(:approved) }
  it { should respond_to(:deal_date) }
  it { should respond_to(:photo_file_name) }
  it { should respond_to(:blurb_title) }
  it { should respond_to(:blurb) }
  it { should respond_to(:deal_type) }
  it { should respond_to(:tipping_point) }
  it { should respond_to(:end_date) }
end
require 'spec_helper'

describe Picture do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
    @picture = user.pictures.build(caption: 'My Dog', description: 'Lorem Epsem')
  end

  subject { @picture }

  it { should respond_to(:caption) }
  it { should respond_to(:description) }
  it { should respond_to(:asset) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @picture.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with the discription that is long" do
  	before { @picture.description = "a" * 141 }
  	it { should_not be_valid }
  end
end


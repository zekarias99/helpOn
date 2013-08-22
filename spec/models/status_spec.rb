require 'spec_helper'

describe Status do
  
  let(:user) { FactoryGirl.create(:user) }	

  before { @status = user.statuses.build(content: "Lorem ipsum") }

  subject {@status}

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @status.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when blank content" do
  	before { @status.content = " "}
  	it { should_not be_valid }
  end
end

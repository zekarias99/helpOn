require 'spec_helper'

describe Album do
  
  let(:user) { FactoryGirl.create(:user) }
  
  before do
    @album = user.albums.build(title: "Haricane", user_id: user.id)
  end

  subject { @album }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @album.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank title" do
    before { @album.title = "  " }
    it { should_not be_valid }
  end

  describe "with title too long" do
    before { @album.title = "z" * 61 }
    it { should_not be_valid }
  end
end

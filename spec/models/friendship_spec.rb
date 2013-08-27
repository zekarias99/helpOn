require 'spec_helper'

describe Friendship do
  let(:user) { FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:user) }
  let(:friendship) { friend.friendships.build(friend_id: friend.id) }

  subject { friendship }

  it { should be_valid }
 # ================ This is testing the dependant destroy =====
 #  it "should destroy associated friendships" do
 #  	friendships = @user.friendships.to_a
 #  	@user.destroy
 #  	expect(friendships).not_to be_empty
 #  	friendships.each do |friend|
 #  	  expect(Friendship.where(id: friend.id)).to be_empty
	# end
 #  end

  describe "friended methods" do
   
   it { should respond_to(:user) }
   it { should respond_to(:friend) }
   its(:user) { should == user }
   its(:friend) { should == friend }
  end

  describe "when friend id is not present" do
    before { friendship.friend_id = nil }
    it { should_not be_valid }
  end
end

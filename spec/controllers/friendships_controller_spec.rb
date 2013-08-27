require 'spec_helper'

describe FriendshipsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:user_friend) { FactoryGirl.create(:user) }

  before { sign_in user, no_capybara: true }

  describe "creating a friendship with Ajax" do

  	it "should increment the friendship count" do
  		expect do
  		xhr :post, :create, friendship: {  friend_id: user_friend.id }
  	    end.to change(Friendship, :count).by(1)
    end

  	it "should respond with success" do
  		xhr :post, :create, friendship: { friend_id: user_friend.id }
  	end
  end
end

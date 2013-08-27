class FriendshipsController < ApplicationController
  before_action :signed_in_user

  def new
  	if params[:friend_id]
  	   @friend = User.find(params[:friend_id])
  	   raise ActiveRecord::RecordNotFound if @friend.nil?	
  	   @friendship = current_user.friendships.new(friend: @friend)	
  	else
  	   flash[:error] = "Friend required"	
  	end

  rescue ActiveRecord::RecordNotFound
  	render file: 'public/404', status: :not_found
  end 

  def create
  	if  params[:friendship] && params[:friendship].has_key?(:friend_id)
  		@friend = User.find(params[:friendship][:friend_id])  
  		@friendship = current_user.friendships.new(friend: @friend)
  		@friendship.save
  		flash[:success] = "You are now friends with #{@friend.full_name}"
  		redirect_to user_path(@friend)
  	else
  	  flash[:error] = "Friend required"
  	  redirect_to root_url	
  	end
  end
end

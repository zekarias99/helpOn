class FriendshipsController < ApplicationController
  before_action :signed_in_user
  respond_to :html, :json

  def index
    @friendships = current_user.friendships.all
     respond_with @friendships
  end

  def accept
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.accept!
      flash[:success] = "You are now friendships with #{@friendship.friend.full_name}"
    else
      flash[:error] = "That friendship could not be accepted"
    end
    redirect_to friendships_path
  end

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
  		#@friendship = current_user.friendships.new(friend: @friend)
      @friendship = Friendship.request(current_user, @friend)
  		if @friendship.new_record?
  		  flash[:error] = "There was problem creating that friend request"
      else
  		  flash[:success] = "Friend request sent."
      end
      redirect_to user_path(@friend)
  	else
  	  flash[:error] = "Friend required"
  	  redirect_to root_url	
  	end
  end

  def edit
    @friendship = current_user.friendships.find(params[:id])
    @friend = @friendship.friend
  end


  private

  def friendship_params
    params.require(:friendship).permit(:user, :friend, :user_id, :friend_id, :state)
  end
end

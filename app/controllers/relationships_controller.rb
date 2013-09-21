class RelationshipsController < ApplicationController
 before_action :signed_in_user 

  def create
    @user = User.find(params[:relationship][:joined_id])
    current_user.join!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).joined
    current_user.unjoin!(@user)
    redirect_to @user
  end
end
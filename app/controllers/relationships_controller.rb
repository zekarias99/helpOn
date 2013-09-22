class RelationshipsController < ApplicationController
 before_action :signed_in_user 

  def create
    @user = User.find(params[:relationship][:joined_id])
    current_user.join!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).joined
    current_user.unjoin!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
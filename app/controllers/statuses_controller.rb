class StatusesController < ApplicationController
 before_action :signed_in_user # note we need this  only: [:create, :destroy]
 before_action :correct_user, only: :destroy

  def create
  	@status = current_user.statuses.build(status_param)
  	if @status.save
  	  flash[:success] = "status created!"
  	  redirect_to root_url
  	else
      @feed_items = []
      render 'static_pages/home'
  	end
  end

  def destroy
    @status.destroy
    redirect_to root_url
  end

  private

  def correct_user
    @status = current_user.statuses.find_by_id(params[:id])
    redirect_to root_url if @status.nil?
  end

  def status_param
  	params.require(:status).permit(:content)
  end	  

end


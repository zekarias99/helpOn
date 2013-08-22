class StatusesController < ApplicationController
 before_action :signed_in_user # note we need this  only: [:create, :destroy]

  def create
  	@status = current_user.statuses.build(status_param)
  	if @status.save
  	  flash[:success] = "status created!"
  	  redirect_to root_path
  	else
      render 'static_pages/home'
  	end
  end

  def destroy
  end

  private

  def status_param
  	params.require(:status).permit(:content)
  end	  

end


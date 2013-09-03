class StatusesController < ApplicationController
 before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
 before_action :correct_user, only: :destroy


def index
 @statuses = Status.all
end

def new
  @status = Status.new
end

def show
  @status = Status.find(params[:id])
end

def edit
  @status = Status.find(params[:id])
end

def create
  @status = Status.new(status_param)
  if @status.save
    flash[:success] = "Status created!" 
    redirect_to root_url
  else
    render :new
  end
end

  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end


  # def create
  # 	@status = current_user.statuses.build(status_param)
  # 	if @status.save
  # 	  flash[:success] = "status created!"
  # 	  redirect_to root_url
  # 	else
  #     @feed_items = []
  #     render 'static_pages/home'
  # 	end
  # end

  def destroy
    @status.destroy
    redirect_to root_url
  end

  private

  # def correct_user
  #   @status = current_user.statuses.find_by(id: params[:id])
  #   redirect_to root_url if @status.nil?
  # end

  def status_param
  	params.require(:status).permit(:content)
  end	  

end


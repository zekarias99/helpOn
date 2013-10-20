class PicturesController < ApplicationController
  before_action :signed_in_user
  before_action :find_user 
  
  before_action :find_picture, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [ :destroy, :edit]
  before_action :add_breadcrumbs

  # before_action :ensure_proper_user, only: [:edit, :new, :create, :update, :destroy]


 def index
   @pictures = current_user.pictures
 end



    def show
      @user = User.find(params[:id])
      @picture = Picture.find(params[:id])
    end


  def new
    @user    = current_user
    @picture = Picture.new
  end

  def edit
    @user    = current_user
    @picture = @user.pictures.find(params[:id])
  end

  def create
    @picture  = current_user.pictures.build(picture_params)
    
    respond_to do |format|
      if @picture.save
        format.html { redirect_to user_picture_path(current_user, @picture), notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to user_pictures_path(@picture), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to user_pictures_url(@picture) }
      format.json { head :no_content }
    end
  end

  # def url_options
  #   { user: params[:user] }.merge(super)
  # end


  private


  # def ensure_proper_user
  #   if current_user != @user
  #     flash[:error] = "You don't have permission to do that."
  #     redirect_to album_pictures_path
  #   end
  # end

  def add_breadcrumbs
    add_breadcrumb  @user.name, user_path(@user)
    add_breadcrumb "Pictures", user_pictures_path(@user, @picture)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

  def find_picture
    @picture = current_user.pictures.find(params[:id])
  end




  # def find_picture
  #   if signed_in? && current_user 
      
  #     @picture = current_user.pictures.find_by(id: params[:picture_id])
  #   else
  #     @picture = @user.pictures.find_by(id: params[:picture_id])
  #   end
  # end

  # def correct_user
  #   @picture = current_user.pictures.find_by(id: params[:id])
  #   redirect_to root_url if @picture.nil?
  # end

  def correct_user
    @picture = current_user.pictures.find_by(id: params[:id])
    redirect_to root_url if @picture.nil?
  end


    def picture_params
      params.require(:picture).permit(:caption, :description, :asset)
    end
end

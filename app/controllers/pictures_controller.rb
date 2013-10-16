class PicturesController < ApplicationController
  before_action :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
  before_action :find_user 
  # before_action :find_album
  before_action :find_picture, only: [:edit, :update, :show, :destroy]
  # before_action :correct_user, only: [ :destroy ]

  # before_action :ensure_proper_user, only: [:edit, :new, :create, :update, :destroy]


 def index
   @albums = current_user.albums 
   @pictures = @album.pictures.all
 end



    def show
      @user = current_user
      @album = current_user.albums.find_by(id: params[:id])
      @pictures  = @album.pictures
    end


  def new
    @user = current_user
    @album = @user.albums.find(params[:album_id])
    @picture = @album.pictures.build
    @pictures = @album.pictures
  end

  
  def edit
    @user    = current_user
    @album   = @user.albums.find_by(id: params[:id])
    @picture = @album.pictures.find_by(id: params[:id])
  end

  def create
    @album = current_user.albums.find_by(id: params[:id])
    @picture = @album.pictures.build(picture_params)
    
    respond_to do |format|
      if @picture.save
        format.html { redirect_to album_pictures_path(@album), notice: 'Picture was successfully created.' }
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
        format.html { redirect_to user_album_pictures_path(@album), notice: 'Picture was successfully updated.' }
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
      format.html { redirect_to album_pictures_url(@album) }
      format.json { head :no_content }
    end
  end


  private

  # def ensure_proper_user
  #   if current_user != @user
  #     flash[:error] = "You don't have permission to do that."
  #     redirect_to album_pictures_path
  #   end
  # end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def find_picture
    @picture = @album.pictures.find_by(id: params[:id])
  end

  # def find_album
  #   if signed_in? && current_user 
      
  #     @album = current_user.albums.find_by(id: params[:id])
  #   else
  #     @album = @user.albums.find_by(id: params[:id])
  #   end
  # end

  # def correct_user
  #   @picture = current_user.pictures.find_by(id: params[:id])
  #   redirect_to root_url if @picture.nil?
  # end


    def picture_params
      params.require(:picture).permit(:caption, :description, :asset)
    end
end

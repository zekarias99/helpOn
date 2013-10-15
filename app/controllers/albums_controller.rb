class AlbumsController < ApplicationController
    before_action :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
    before_action :find_user 
    before_action :find_album, only: [:edit, :update, :destroy, :show,]

  def index
    @albums = Album.all
  end

  def show
    @user = current_user
    @album = @user.albums.find(params[:id])
  end

  
  def new
    @user = current_user
    @album = Album.new
  end

  def edit
  end

  # def create
  #   @album = current_user.albums.build(album_params)

  #   respond_to do |format|
  #     if @album.save
  #       format.html { redirect_to @album, notice: 'Album was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @album }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @album.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
     @album = current_user.albums.build(album_params)
    if @album.save
      redirect_to user_album_path(current_user, @album), notice: 'Album was successfully created.'
    else
      render action: "new"
    end
  end

  
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  # def correct_user
  #   @album = current_user.albums.find_by(id: params[:id])
  #   redirect_to root_url if @album.nil?
  # end

  def find_album
    @album = current_user.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title)
  end
end













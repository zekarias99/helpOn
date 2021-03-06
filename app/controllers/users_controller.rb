class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit, :update, 
                                        :destroy, :joining, :joiners]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @charities  = @user.charities.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:succes] = "Welcome to HelpOn"
      redirect_to @user
    else
      render 'new'
    end

  def edit
     @user = User.find(params[:id])
  end
  
  end

 def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def joining
    @title = "Joining"
    @user = User.find(params[:id])
    @users = @user.joined_users.paginate(page: params[:page])
    render 'show_join'
  end

  def joiners
    @title = "Joiners"
    @user = User.find(params[:id])
    @users = @user.joiners.paginate(page: params[:page])
    render 'show_join'
  end


  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, 
                                 :avatar, :cover_picture, :password_confirmation)
  end
  
  # Before filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

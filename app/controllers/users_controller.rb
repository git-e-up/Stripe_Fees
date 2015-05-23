class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    user = User.create ( user_params )
    redirect_to "/"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!( user_params )
    redirect_to "/"
  end

  def destroy
    User.destroy(params[:id])
    redirect_to "/user"
  end

  def profile
    authenticate!
    @user = current_user
  end

  def sign_in
    # render sign-in form here
  end

  private

  def user_params
    params.require(:user).permit(:name, :api_key, :password)
  end


end

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
    @fees = @user.fees
    @api_key = (params[:api_key])
  end

  def sign_in
    @user = current_user
    # render sign-in form here
  end

  def api_key
    puts params[:api_key]
    authenticate!

    current_user.update({api_key: params[:api_key]})
    current_user.save!
    redirect_to '/profile'
  end

  def calendar
    @start_date = params[:start_date] || Date.today
    @end_date = params[:end_date] || Date.today
  # will set @date to Date.today if params[:date].nil?
  end

  def dates
    @start_year = params[:start_year] || Date.today
  end

  private

  def user_params
    params.require(:user).permit(:username, :api_key, :password, :start_date, :end_date)
  end


end

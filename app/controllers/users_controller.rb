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




  require 'date'
  def dates
    authenticate!
    @user = current_user
    @api_key = (params[:api_key])

    date = params[:date]
    year = date[:year].to_i
    month = date[:month].to_i
    day = date[:day].to_i

    start_date = Date.new(year, month, day)
    end_date = start_date.next_month

    @fees = @user.fees(start_date, end_date)
    render 'profile'
  end

  private

  def user_params
    params.require(:user).permit(:username, :api_key, :password, :start_date, :end_date)
  end


end

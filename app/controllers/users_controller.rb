class UsersController < ApplicationController

  def initialize
    @dates = nil
  end
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




  # require 'date'
  # def dates
  #   authenticate!
  #   @user = current_user
  #   @api_key = (params[:api_key])
  #
  #   date = params[:date]
  #   year = date[:year].to_i
  #   month = date[:month].to_i
  #   day = date[:day].to_i
  #
  #   @dates = Date.new(year, month, day)
  #   # @dates = start_date
  #
  #   # @fees = @user.fees(start_date, end_date)
  #   # render 'end_dates'
  # end

  def end_dates

    authenticate!
    @user = current_user
    @api_key = (params[:api_key])

    puts params[:start]
    puts params[:end]

    start_date = params[:start]
    end_date = params[:end]

    # puts end_date[:year].to_i
    # puts end_date[:month].to_i
    # puts end_date[:day].to_i

    # end_date = params[:date]
    # end_year = end_date[:year].to_i
    # end_month = end_date[:month].to_i
    # end_day = end_date[:day].to_i

    start_parsed_date = Date.new(start_date[:year].to_i, start_date[:month].to_i, start_date[:day].to_i)

    end_parsed_date = Date.new(end_date[:year].to_i, end_date[:month].to_i, end_date[:day].to_i)
    # start_date = @dates

    @fees = @user.fees(start_parsed_date, end_parsed_date)
    # send_file "public/Preloader_3.gif", type: "image/gif", disposition: "inline"
    #
    # render 'profile' do |page|
    #       page.replace_html "display_ajax", :partial => 'name-of-your-partial'
    render 'profile'
     

  end


  private

  def user_params
    params.require(:user).permit(:username, :api_key, :password, :start_date, :end_date)
  end


end

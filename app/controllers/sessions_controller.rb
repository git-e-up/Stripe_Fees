class SessionsController < ApplicationController

      def log_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate( params[:password] )
          session[:user_id] = user.id
          redirect_to "/profile"
          # skip_before_filter  :verify_authenticity_token
        else
          redirect_to "/"
        end
      end

      def log_out
        session[:user_id] = nil
        redirect_to "/"
      end




end

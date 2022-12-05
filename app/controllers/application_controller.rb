class ApplicationController < ActionController::API
  include ActionController::Cookies

  def create 
    user = User.find_by(username: params[:username])

    if user&.authenticate(username: params[:username])
      session[:user_id] = user.id

      render json: user ,status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end
end

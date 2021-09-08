class SessionsController < ApplicationController
    def create
        user = User.find_by(username: user_params[:username])
        authenticated = user.authenticate(user_params[:password])
        session[:user_id] = user.id
        render json: user
    end

    def destroy
        session.delete :user_id
        render json: { "message": "delete route" }
    end

    private

    def user_params
        params.permit(:username, :password, :session)
    end
end
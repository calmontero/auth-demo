class UsersController < ApplicationController
    def index
        session[:id] = "id"
        cookies[:test] = "test"
        render json: { session: session, cookies: cookies }
    end

    def show
        #byebug
        render json: { message: "show" }
    end

    def create
        username = user_params[:username]
        password = user_params[:password]
        user = User.new(username: username)
        user.password = password
        user.save
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end

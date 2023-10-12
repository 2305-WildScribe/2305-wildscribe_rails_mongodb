class Api::V0::UsersController < ApplicationController
    
    def create
        user = User.new(user_create_params)
        if user.save
            render json: {message: "User Created"}, status: 201
        else
            render json: {message: "Invalid Entry"}, status: 422
        end
    end

    def login
        user = User.find_by!(email: login_params[:email])
        if user.authenticate(login_params[:password])
            render json: {data: { type: "user", user_id: user.id }}
        end 
    rescue ActiveRecord::RecordNotFound
        render json: {message: "User not found"}, status: 404
    end

    def update
        user = User.find(search_params[:user_id])
        if user.authenticate(update_params[:password])
            user.update(update_params)
            render json: {message: "User Updated Successfully"}, status: 200
        end 
    rescue ActiveRecord::RecordNotFound
        render json: {message: "User not found"}, status: 404
    end

    def destroy
        user = User.find_by!(email: login_params[:email])
        if user.authenticate(login_params[:password])
            user.destroy
            render json: {message: "User deleted successfully"}, status: 204
        end 
    rescue ActiveRecord::RecordNotFound
        render json: {message: "User not found"}, status: 404
    end

    private

    def user_create_params
        params.require(:body).permit(:name, :email, :password, :password_confirmation)
    end

    def login_params
        params.require(:body).permit(:email, :password)
    end

    def search_params
        params.require(:body).permit(:user_id)
    end

    def update_params
        params.require(:body).permit(:name, :email, :password, :password_confirmation)
    end

end
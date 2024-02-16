class Api::V0::UsersController < ApplicationController
    
    def create
        user = User.new(user_params[:attributes])
        if user.save
            render json: {data: {type: "user", message: "User Created", attributes: {user_id: user.id}}}, status: 201
        else
            render json: {message: "Invalid Entry"}, status: 422
        end
    end

    def login
        user = User.find_by!(email: user_params[:attributes][:email])
        if user.authenticate(user_params[:attributes][:password])
            render json: {data: { type: "user", attributes: {name: user.name, user_id: user.id}}}
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


    def login_params
        params.require(:body).permit(:email, :password)
    end

    def search_params
        params.require(:body).permit(:user_id)
    end

    def user_params
        params.require(:data).permit( :type, attributes: [:name, :email, :password])
    end

end
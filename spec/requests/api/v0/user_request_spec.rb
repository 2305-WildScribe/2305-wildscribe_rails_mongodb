require "rails_helper"

RSpec.describe "Users API" do

    describe "Create User" do
        xit 'Returns 201 if user created successfully' do

            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(201)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:message]).to eq("User Created")

            user = User.last

            expect(user.name).to eq("Ian")
        end

        xit 'Returns 422 if User cant be created' do

            post api_v0_user_path body: {name: "", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response.status).to eq(422)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:message]).to eq("Invalid Entry")

            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "123"}

            expect(response.status).to eq(422)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:message]).to eq("Invalid Entry")

        end
    end

    describe "Login User" do

        xit 'Returns 200, and user ID and name if User exist' do

            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(201)

            post api_v0_login_path body: {email: "ian@gmail.com", password: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(200)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:data]).to have_key(:type)
            expect(message[:data]).to have_key(:user_id)

        end

        xit 'Returns 404 if User does not exist' do

            post api_v0_login_path body: {email: "ian@gmail.com", password: "12345"}

            expect(response.status).to eq(404)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:message]).to eq("User not found")

        end
    end

    describe "Update User" do
        xit 'returns 200 when given proper update params' do

            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(201)


            user = User.last

            expect(user.name).to eq("Ian")

            patch api_v0_user_path  body: {user_id: user.id, name: "Tim", email: "ian@gmail.com", password: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(200)

            user = User.last

            expect(user.name).to eq("Tim")
        end

        xit 'returns 404 if user dosent exist' do

            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(201)


            user = User.last

            expect(user.name).to eq("Ian")

            patch api_v0_user_path  body: {user_id: 15, name: "Tim", email: "ian@gmail.com", password: "12345"}


            expect(response.status).to eq(404)

        end
    end

    describe 'Delete User' do
        xit 'Returns 200 if user delete successful' do
            post api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}


            expect(response).to be_successful

            expect(response.status).to eq(201)

            user = User.last

            expect(user.name).to eq("Ian")

            delete api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response).to be_successful

            expect(response.status).to eq(204)

            expect(User.find_by(id: user.id)).to eq(nil)
        end

        xit 'returns 404 if user dosent exist' do
            delete api_v0_user_path body: {name: "Ian", email: "ian@gmail.com", password: "12345", password_confirmation: "12345"}

            expect(response.status).to eq(404)

            message = JSON.parse(response.body, symbolize_names: true)

            expect(message[:message]).to eq("User not found")
        end
    end
end
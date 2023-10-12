class Api::V0::User::AdventuresController < ApplicationController
  
  def create
    adventures = Adventure.new(adventure_params)
    if adventures.save!
      render json: {message: "Adventure successfully logged"}, status: 201
    else
      render json: {message: "Adventure not saved"}, status: 400
    end
  end

  private

  def adventure_params
    params.require(:data).permit(:user_id, attributes: [:activity, :notes, :image_url, :stress_level, :hydration, :diet])
  end

end
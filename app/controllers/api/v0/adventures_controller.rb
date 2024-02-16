class Api::V0::AdventuresController < ApplicationController
  
  def create
    adventure = Adventure.new(adventure_params[:attributes])
    if adventure.save!
      render json: {data: { type: "adventure", attributes:{adventure: adventure }}}
    else
      render json: {message: "Adventure not saved"}, status: 400
    end
  end

  def show
    adventure = Adventure.find_by!(id: adventure_params[:attributes][:adventure_id])
    render json: {data: { type: "adventure", attributes: {adventure: adventure }}}
  rescue ActiveRecord::RecordNotFound
    render json: {message: "Adventure not found"}, status: 404
  end

  def update
    adventure = Adventure.find_by!(id: adventure_params[:attributes][:adventure_id])
    adventure.update(adventure_params[:attributes])
    render json: {data: { type: "user", attributes: {adventure: adventure }}}
  rescue ActiveRecord::RecordNotFound
    render json: {message: "Adventure not found"}, status: 404
  end

  def index
    # user = User.find(adventure_params[:attributes][:user_id])
    adventures = Adventure.find_by("user_id" => "652edaa67a75034ea37c6652" )
    render json: {data: { type: "adventures", attributes:{adventures: adventures}}}
  rescue ActiveRecord::RecordNotFound
    render json: {message: "Adventure not found"}, status: 404
  end

  def delete
    adventure = Adventure.find_by!(id: adventure_params[:attributes][:adventure_id])
    render json: {data: { type: "adventure", message: "Adventure Deleted"}}
  rescue ActiveRecord::RecordNotFound
    render json: {message: "Adventure not found"}, status: 404
  end

  private

  def adventure_params
    params.require(:data).permit(:type, attributes: [:activity, :hours_slept, :adventure_id, :user_id, :date, :diet_hydration_notes, :sleep_stress_notes, :beta_notes, :image_url, :stress_level, :hydration, :diet])
  end
end

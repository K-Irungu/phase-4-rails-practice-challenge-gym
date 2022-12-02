class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    # GET '/gyms'
    def index
        render json: Gym.all, status: :ok
    end

    # GET '/gyms/:id'
    def show
        render json: Gym.find(params[:id]), status: :ok
    end

    # PATCH '/gyms/:id'
    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end

    # DELETE '/gyms/:id'
    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private
    def render_record_not_found
        render json: { error: "Gym not found" }, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end
end

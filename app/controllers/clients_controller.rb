class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    # GET '/clients'
    def index
        render json: Client.all, status: :ok
    end

    # GET '/clients/:id'
    def show
        render json: Client.find(params[:id]), status: :ok
    end
     
    # PATCH '/clients/:id'
    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :ok
    end

    private
    def render_record_not_found
        render json: { error: "Client not found" }, status: :not_found
    end

    def client_params
        params.permit(:name, :age)
    end
end

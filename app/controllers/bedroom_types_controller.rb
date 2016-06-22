class BedroomTypesController < ApplicationController
  before_action :authenticate
  before_action :set_bedroom_type, only: [:show, :update, :destroy]

  # GET /bedroom_types
  def index
    @bedroom_types = BedroomType.all
    render json: @bedroom_types
  end

  # GET /bedroom_types/1
  def show
    render json: @bedroom_type
  end

  # POST /bedroom_types
  def create
    @bedroom_type = BedroomType.new(bedroom_type_params)

    if @bedroom_type.save
      render json: @bedroom_type, status: :created, location: @bedroom_type
    else
      render json: @bedroom_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bedroom_types/1
  def update
    if @bedroom_type.update(bedroom_type_params)
      render json: @bedroom_type
    else
      render json: @bedroom_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bedroom_types/1
  def destroy
    @bedroom_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bedroom_type
      @bedroom_type = BedroomType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bedroom_type_params
      params.require(:bedroom_type).permit(:name, :price)
    end
end

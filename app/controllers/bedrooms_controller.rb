class BedroomsController < ApplicationController
  before_action :set_bedroom, only: [:show, :edit, :update, :destroy]

  # GET /bedrooms
  def index
    @bedrooms = Bedroom.all
    render json: @bedrooms
  end

  # GET /bedrooms/1
  def show
    render json: @bedroom
  end

  # POST /bedrooms
  def create
    @bedroom = Bedroom.new(bedroom_params)

    if @bedroom.save
      render json: @bedroom, status: :created, location: @user
    else
      render json: @bedroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bedrooms/1
  def update
    if @bedroom.update(bedroom_params)
      render json: @bedroom
    else
      render json: @bedroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bedrooms/1
  def destroy
    @bedroom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bedroom
      @bedroom = Bedroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bedroom_params
      params.require(:bedroom).permit(:number, :beds, :bedroomType_id)
    end
end

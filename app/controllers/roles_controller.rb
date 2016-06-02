class RolesController < ApplicationController
  before_action :authenticate
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index]

  def index
    @roles = Role.all

    if @user
      return render json: @user.roles
    end

    render json: @roles
  end

  def show
    render json: @role
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      render json: @role, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id]) if params[:user_id]
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name)
    end
end

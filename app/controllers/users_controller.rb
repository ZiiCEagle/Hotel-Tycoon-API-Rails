class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :attach_role, :detach_role]
  before_action :authenticate, except: [:login]

  # GET /users
  def index
    @users = User.all

    if params[:is_activated]
      @users = @users.where(is_activated: params[:is_activated])
    end

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def attach_role
    @role = Role.find(params[:role_id])

    unless @user.roles.include?(@role)
       @user.roles << @role
    end

    render json: @user, status: :ok
  end

  def detach_role
    @role = Role.find(params[:role_id])
    @user.roles.delete(@role)

    render json: @user, status: :ok
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: @user, status: :ok
    else
      render json: {errors: ["Invalid Username or Password"]}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :is_activated)
    end
end

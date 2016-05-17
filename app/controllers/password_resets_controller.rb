class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
  end

  def create
    @user = User.find_by_email!(params[:email])

    @user.set_reset_password_token
    render json: {notice: "Email envoyé"}, status: :ok
  end

  def edit
    unless reset_password_token_valid?
      return redirect_to password_resets_url, notice: {title: "Oh mince !", content: "Le token est expiré", context: "danger"}
    end
  end

  def update
    unless reset_password_token_valid?
      return redirect_to password_resets_url, notice: {title: "Oh mince !", content: "Le token est expiré", context: "danger"}
    end

    if @user.update_attributes(user_params)
      @user.reset_password_token = nil
      @user.reset_password_token_expires_at = nil
      @user.save
      return redirect_to password_resets_url, notice: {title: "Bravo !", content: "Mot de passé modifié", context: "success"}
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_reset_password_token!(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def reset_password_token_valid?
      @user.reset_password_token_expires_at > Time.zone.now
    end
end

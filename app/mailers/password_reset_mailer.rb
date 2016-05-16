class PasswordResetMailer < ApplicationMailer

  add_template_helper(UserHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_reset_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(@user.reset_password_token)

    mail to: @user.email, subject: "Demande de réinitialisation du mot de passe"
  end
end

class UserMailer < ApplicationMailer

  add_template_helper(UserHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject

  def user_created(user)
    @user = user

    mail to: @user.email, subject: "Bienvenue sur l'application Hotel Tycoon !"
  end
end

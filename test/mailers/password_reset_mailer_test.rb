require 'test_helper'

class PasswordResetMailerTest < ActionMailer::TestCase
  test "reset_password_email" do
    @tim = users(:tim)
    mail = PasswordResetMailer.reset_password_email(@tim)
    assert_equal "Demande de réinitialisation du mot de passe", mail.subject
    assert_equal ["from@example.com"], mail.from
    assert_equal [@tim.email], mail.to
  end
end

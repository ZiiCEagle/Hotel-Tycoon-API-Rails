require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  include UserHelper
  test "user_created" do
    @tim = users(:tim)
    mail = UserMailer.user_created(@tim)
    assert_equal "Bienvenue sur l'application Hotel Tycoon !", mail.subject
    assert_equal ["from@example.com"], mail.from
    assert_equal [@tim.email], mail.to
  end
end

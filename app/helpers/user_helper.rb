module UserHelper
  def user_info(user)
    "#{user.last_name} #{user.first_name}".titleize
  end
end

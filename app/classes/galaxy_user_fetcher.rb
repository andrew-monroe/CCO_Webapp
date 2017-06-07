class GalaxyUserFetcher < GalaxyApiFetcher
  def get_user(user_email)
    User.find_by(email: "#{user_email}")
  end

  def get_user_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/user/list/")
  end

  def update_user_database
    user_list = get_user_list_from_galaxy
    user_list.each do |user|
      User.create({
        first_name: user['firstName'],
        last_name: user['lastName'],
        email: user['email'],
        admin: false,
        moderator_for: ""
        })
    end
  end
end

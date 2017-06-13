class GalaxyUserFetcher < GalaxyApiFetcher

  def get_user_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/user/list/")
  end

  def update_user_database
    get_user_list_from_galaxy.each do |galaxy_user|
      User.find_or_create_by(email: galaxy_user['email']) do |user|
        user.first_name = galaxy_user['firstName']
        user.last_name = galaxy_user['lastName']
        user.admin = false
        user.moderator_for = ""
      end
    end
  end
end

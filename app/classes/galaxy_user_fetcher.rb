class GalaxyUserFetcher < GalaxyApiFetcher

  def get_user_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/user/list/")
  end

  def update_user_database
    page = 0
    uri = "/volunteer/user/list/"
    optional_params = {}
    get_more = []
    while page == 0 || get_more != []
      get_more = get_list_from_galaxy(uri,optional_params,50,page*50)
      get_more.each do |galaxy_user|
        add_user_to_database(galaxy_user)
      end
      page += 1
    end
  end

  def dump_user_database
    User.all.each do |user|
      user.destroy
    end
  end

  private
  def add_user_to_database(galaxy_user)
    @user = User.find_or_create_by(email: galaxy_user['email'])
    @user.update_attributes({
      first_name: galaxy_user['firstName'].to_s.downcase.titleize,
      last_name: galaxy_user['lastName'].to_s.downcase.titleize,
      admie: false,
      moderator_foe: ""
    })
  end
end

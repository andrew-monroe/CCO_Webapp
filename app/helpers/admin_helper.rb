module AdminHelper
  require "http"

  def import_user_list_from_galaxy
    user_list = get_user_list

    save_user_list(user_list)
  end

  def get_full_user_list
    offset = 0
    full_user_list = get_user_list(offset)

    add_to_list = get_user_list(offset)
    while add_to_list != []
      full_user_list += get_user_list(offset)
      offset += 50
      add_to_list = get_user_list(offset)
    end

    full_user_list
  end

  def get_user_list(offset)
    HTTP.get("https://api2.galaxydigital.com/volunteer/user/list/",
              :params => {  :key => "#{ENV["GALAXY_API_KEY"]}",
                            :limit => "50", :offset => "#{offset}"})
  end

  def save_user_list(user_list)
    user_list.each do |user|
      User.new(user).save
    end
  end
end

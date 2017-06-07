class GalaxyApiFetcher
  PAGE_LENGTH = 50

  private
  def get_from_galaxy(uri,optional_params={})
    response = HTTP.get("https://api2.galaxydigital.com#{uri}",
                :params => optional_params.merge({ :key => "#{ENV["GALAXY_API_KEY"]}" }))
    response.status == 200 ? JSON.parse(response.body)["data"] : false
  end

  def get_list_from_galaxy(uri,optional_params={},limit=50,offset=0)
    get_from_galaxy(uri,optional_params.merge({:limit=>"#{limit}",:offset=>"#{offset}"}))
  end

  def get_full_list_from_galaxy(uri,optional_params={})
    page = 0
    full_list = []
    get_more = []
    while page == 0 || get_more != []
      get_more = get_list_from_galaxy(uri,optional_params,PAGE_LENGTH,page*PAGE_LENGTH)
      full_list += get_more
      page += 1
    end
    full_list
  end
end

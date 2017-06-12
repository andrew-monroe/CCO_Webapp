class GalaxyAgencyFetcher < GalaxyApiFetcher
  # def get_agency(agency_name)
  #   Agency.find_by(name: "#{agency_name}")
  # end

  def update_agency_database
    get_agency_list_from_galaxy.each do |galaxy_agency|
      Agency.find_or_create_by(galaxy_id: galaxy_agency['agencyId']) do |agency|
        agency.name = galaxy_agency['agencyName']
      end
    end
  end

  private
  def get_agency_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/agency/list/")
  end
end

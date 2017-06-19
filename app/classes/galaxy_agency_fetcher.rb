class GalaxyAgencyFetcher < GalaxyApiFetcher

  def update_agency_database
    get_agency_list_from_galaxy.each do |galaxy_agency|
      @agency = Agency.find_or_create_by(galaxy_id: galaxy_agency['agencyId'])
      @agency.update_attributes({name: galaxy_agency['agencyName'].to_s})
    end
  end

  private
  def get_agency_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/agency/list/")
  end
end

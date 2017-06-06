module AgencyHelper
  def get_agency(agency_name)
    Agency.find_by(name: "#{agency_name}")
  end

  def get_agency_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/agency/list/")
  end

  def update_agency_database
    agency_list = get_agency_list_from_galaxy
    agency_list.each do |agency|
      Agency.create({
        name: agency['agencyName']
        })
    end
  end
end

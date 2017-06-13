class GalaxyNeedFetcher < GalaxyApiFetcher

  def get_need_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/need/list/")
  end

  def update_need_database
    get_need_list_from_galaxy.each do |galaxy_need|
      if @agency = Agency.find_by(galaxy_id: galaxy_need['agencyId'])
        @agency.needs.find_or_create_by(galaxy_id: galaxy_need['needId']) do |need|
          need.title = galaxy_need['needTitle']
          need.description = galaxy_need['needDetails']
          need.agency_name = galaxy_need['agencyName']
          need.time = galaxy_need['needHoursDescription']
          need.location = convert_galaxy_need_location(galaxy_need)
          need.volunteers_needed = galaxy_need['needVolunteersNeeded']
          need.volunteers_signed_up = get_volunteers_signed_up_count(galaxy_need['needId'])
          need.agency_id = galaxy_need['agencyId']
          need.need_link = galaxy_need['needLink']
          need.start_date_time = parse_start_date_time(galaxy_need['needDate'], galaxy_need['needHoursDescription'])
          need.end_date_time = parse_end_date_time(galaxy_need['needDate'], galaxy_need['needHoursDescription'])
        end
      end
    end
  end

  private
  def get_volunteers_signed_up_count(need_galaxy_id)
    if need_galaxy_id == nil
      return nil
    end
    volunteers_signed_up = get_from_galaxy("/volunteer/response/list/",
                            { :agencyId => need_galaxy_id })
    volunteers_signed_up.count
  end

  def convert_galaxy_need_location(need)
    address = need['needAddress']!=nil ? need['needAddress']+"\n" : ""
    if need['needCity']!=nil && need['needState']!=nil
      city = need['needCity'] + ", "
      state = need['needState'] + " "
    else
      city = need['needCity']!=nil ? need['needCity'] + " " : ""
      state = need['needState']!=nil ? need['needState'] + " " : ""
    end
    zip = need['needZip'].to_s
    address+city+state+zip
  end

  def get_concise_date_string(galaxy_date_string)
    begin
      galaxy_date_string.partition(" ")[0]
    rescue
      nil
    end
  end

  def parse_start_date_time(galaxy_date_string, galaxy_time_string)
    begin
      date_time_string = get_concise_date_string(galaxy_date_string)+" "+get_start_time_string(galaxy_time_string)
      DateTime.parse(date_time_string)
    rescue
      nil
    end
  end

  def parse_end_date_time(galaxy_date_string, galaxy_time_string)
    begin
      date_time_string = get_concise_date_string(galaxy_date_string)+" "+get_end_time_string(galaxy_time_string)
      DateTime.parse(date_time_string)
    rescue
      nil
    end
  end

  def get_start_time_string(galaxy_time_string)
    begin
      am_pm_partitioned_string = galaxy_time_string.partition(/.M/)
      am_pm_partitioned_string[0].partition("-")[0]+am_pm_partitioned_string[1]
    rescue
      nil
    end
  end

  def get_end_time_string(galaxy_time_string)
    begin
      partitioned_string = galaxy_time_string.partition("-")[2]
    rescue
      nil
    end
  end
end

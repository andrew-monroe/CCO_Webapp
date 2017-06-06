module NeedsHelper
  include ApplicationHelper

  def get_need(need_name)
    Need.find_by(name: "#{need_name}")
  end

  def get_need_list_from_galaxy
    get_full_list_from_galaxy("/volunteer/need/list/")
  end

  def update_need_database
    need_list = get_need_list_from_galaxy
    need_list.each do |need|
      Need.create({
        title: need['needTitle'],
        description: need['needDetails'],
        agency: need['agencyName'],
        time: need['needHoursDescription'],
        location: convert_galaxy_need_location(need),
        volunteers_needed: need['needVolunteersNeeded'],
        volunteers_signed_up: get_volunteers_signed_up_count(need['needId']),
        agency_id: need['agencyId'],
        galaxy_id: need['needId']
        })
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
end

module NeedsHelper

  def get_volunteers_emails(need)
    email_list = ""
    GalaxyNeedFetcher.new.get_volunteers_signed_up(need.galaxy_id).each do |volunteer|
      email_list += volunteer['email']+" "
    end
    email_list
  end

  def get_email_subject_line(need)
    need.title + " - " + need.formatted_start_datetime
  end
end

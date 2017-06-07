class GalaxyController < ApplicationController
  before_action :authenticate_admin!

  def fetch_needs
    GalaxyNeedFetcher.new.update_need_database
    redirect_to needs_path
  end

  def fetch_agencies
    GalaxyAgencyFetcher.new.update_agency_database
    redirect_to agencies_path
  end

  def fetch_users
    GalaxyUserFetcher.new.update_user_database
    redirect_to users_path
  end
end

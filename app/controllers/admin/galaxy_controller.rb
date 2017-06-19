class Admin::GalaxyController < ApplicationController
  before_action :authenticate_admin!

  def fetch_needs
    GalaxyNeedFetcher.new.update_need_database
    redirect_to admin_needs_path
  end

  def fetch_agencies
    GalaxyAgencyFetcher.new.update_agency_database
    redirect_to admin_agencies_path
  end

  def fetch_users
    GalaxyUserFetcher.new.update_user_database
    redirect_to admin_users_path
  end
end

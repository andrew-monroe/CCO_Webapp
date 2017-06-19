task :fetch_needs => :environment do
  puts "Fetching needs from Galaxy..."
  GalaxyNeedFetcher.new.update_need_database
  puts "Done."
end
task :reset_needs => :environment do
  puts "Dump and re-fetch needs according to Galaxy..."
  Need.destroy_all
  GalaxyNeedFetcher.new.update_need_database
  puts "Done."
end
task :destroy_all_needs => :environment do
  puts "Dump need database..."
  Need.destroy_all
  puts "Done."
end


task :fetch_agencies => :environment do
  puts "Fetching agencies from Galaxy..."
  GalaxyAgencyFetcher.new.update_agency_database
  puts "Done."
end
task :reset_agencies => :environment do
  puts "Dump and re-fetch agencies according to Galaxy..."
  Agency.destroy_all
  GalaxyAgencyFetcher.new.update_agency_database
  puts "Done."
end
task :destroy_all_agencies => :environment do
  puts "Dump agency database..."
  Agency.destroy_all
  puts "Done."
end


desc "This task probably doesn't need to be used."
task :fetch_users => :environment do
  puts "Fetching users from Galaxy..."
  GalaxyUsersFetcher.new.update_user_database
  puts "Done."
end
task :reset_users => :environment do
  puts "Dump and re-fetch users according to Galaxy..."
  User.destroy_all
  GalaxyUsersFetcher.new.update_user_database
  puts "Done."
end
task :destroy_all_users => :environment do
  puts "Dump user database..."
  User.destroy_all
  puts "Done."
end

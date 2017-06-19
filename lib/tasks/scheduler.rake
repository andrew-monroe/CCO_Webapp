task :update_needs => :environment do
  puts "Updating needs according to Galaxy..."
  GalaxyNeedFetcher.new.update_need_database
  puts "Done."
end
task :reset_needs => :environment do
  puts "Dump and reobtain needs according to Galaxy..."
  GalaxyNeedFetcher.new.dump_need_database
  GalaxyNeedFetcher.new.update_need_database
  puts "Done."
end
task :dump_needs => :environment do
  puts "Dump need database..."
  GalaxyNeedFetcher.new.dump_need_database
  puts "Done."
end


task :update_agencies => :environment do
  puts "Updating agencies according to Galaxy..."
  GalaxyAgencyFetcher.new.update_agency_database
  puts "Done."
end
task :reset_agencies => :environment do
  puts "Dump and reobtain agencies according to Galaxy..."
  GalaxyAgencyFetcher.new.dump_agency_database
  GalaxyAgencyFetcher.new.update_agency_database
  puts "Done."
end
task :dump_agencies => :environment do
  puts "Dump agency database..."
  GalaxyAgencyFetcher.new.dump_agency_database
  puts "Done."
end


desc "This task probably doesn't need to be used."
task :update_users => :environment do
  puts "Updating users according to Galaxy..."
  GalaxyUsersFetcher.new.update_user_database
  puts "Done."
end
task :reset_users => :environment do
  puts "Dump and reobtain users according to Galaxy..."
  GalaxyUsersFetcher.new.dump_user_database
  GalaxyUsersFetcher.new.update_user_database
  puts "Done."
end
task :dump_users => :environment do
  puts "Dump user database..."
  GalaxyUsersFetcher.new.dump_user_database
  puts "Done."
end

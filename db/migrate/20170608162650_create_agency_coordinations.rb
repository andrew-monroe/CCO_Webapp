class CreateAgencyCoordinations < ActiveRecord::Migration[5.1]
  def change
    create_join_table(:agencies, :coordinators) 
  end
end

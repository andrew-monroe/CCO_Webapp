class AddGalaxyIdToAgencyModel < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :galaxy_id, :integer
  end
end

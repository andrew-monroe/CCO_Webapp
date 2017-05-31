class AddIdsToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :agency_id, :integer
    add_column :needs, :galaxy_id, :integer
  end
end

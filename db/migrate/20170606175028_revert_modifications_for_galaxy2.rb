class RevertModificationsForGalaxy2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :disasterContact
  end
end

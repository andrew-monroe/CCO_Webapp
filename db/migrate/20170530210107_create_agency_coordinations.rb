class CreateAgencyCoordinations < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_coordinations do |t|
      t.integer :coordinator_id
      t.integer :agency_id

      t.timestamps
    end
  end
end

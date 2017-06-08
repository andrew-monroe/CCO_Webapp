class ChangeInNeedAgencyToAgencyName < ActiveRecord::Migration[5.1]
  def change
    rename_column :needs, :agency, :agency_name
  end
end

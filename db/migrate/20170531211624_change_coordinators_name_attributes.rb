class ChangeCoordinatorsNameAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_column :coordinators, :f_name, :first_name
    rename_column :coordinators, :l_name, :last_name
    rename_column :admins, :f_name, :first_name
    rename_column :admins, :l_name, :last_name
  end
end

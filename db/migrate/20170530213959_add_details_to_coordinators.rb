class AddDetailsToCoordinators < ActiveRecord::Migration[5.1]
  def change
    add_column :coordinators, :f_name, :string
    add_column :coordinators, :l_name, :string
    add_column :coordinators, :galaxy_id, :integer
  end
end

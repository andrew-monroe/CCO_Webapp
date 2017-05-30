class AddDetailsToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :f_name, :string
    add_column :admins, :l_name, :string
    add_column :admins, :galaxy_id, :integer
  end
end

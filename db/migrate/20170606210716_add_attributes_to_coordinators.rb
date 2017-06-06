class AddAttributesToCoordinators < ActiveRecord::Migration[5.1]
  def change
    add_column :coordinators, :moderator_for, :string
  end
end

class RemoveAttributesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin
    remove_column :users, :moderator_for
  end
end

class ChangeUsersAttributeQuickFix < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :referenceID, :referenceId

  end
end

class ChangeUsersAttributeQuickFix2 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :disasterContact, :string
  end
end

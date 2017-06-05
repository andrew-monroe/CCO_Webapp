class ModifyUsersAttributesForGalaxy < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :first_name, :firstName
    rename_column :users, :last_name, :lastName
    remove_column :users, :ku_id
    remove_column :users, :admin
    remove_column :users, :moderator_for
    add_column    :users, :status, :string
    add_column    :users, :referenceID, :string
    add_column    :users, :middleName, :string
    add_column    :users, :mobile, :string
    add_column    :users, :phone, :string
    add_column    :users, :company, :string
    add_column    :users, :gender, :string
    add_column    :users, :birthdate, :string
    add_column    :users, :address, :string
    add_column    :users, :address2, :string
    add_column    :users, :city, :string
    add_column    :users, :state, :string
    add_column    :users, :postal, :string
    add_column    :users, :dateAdded, :string
    add_column    :users, :dateUpdated, :string
    add_column    :users, :dateLastLogin, :string
    add_column    :users, :link, :string
    add_column    :users, :expires, :string
    add_column    :users, :now, :string
  end
end

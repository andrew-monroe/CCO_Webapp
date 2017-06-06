class RevertModificationsForGalaxy < ActiveRecord::Migration[5.1]
  def change
    rename_column :agencies, :agencyName, :name

    remove_column    :agencies, :agencyLink
    remove_column    :agencies, :agencyAddress
    remove_column    :agencies, :agencyAddress2
    remove_column    :agencies, :agencyCity
    remove_column    :agencies, :agencyState
    remove_column    :agencies, :agencyZip
    remove_column    :agencies, :agencyPhone
    remove_column    :agencies, :agencyContact
    remove_column    :agencies, :agencyURL
    remove_column    :agencies, :agencyDescription
    remove_column    :agencies, :dateAdded
    remove_column    :agencies, :dateUpdated
    remove_column    :agencies, :status

    rename_column :users, :firstName, :first_name
    rename_column :users, :lastName, :last_name
    add_column :users, :admin, :boolean
    add_column :users, :moderator_for, :string

    remove_column    :users, :status
    remove_column    :users, :referenceId
    remove_column    :users, :middleName
    remove_column    :users, :mobile
    remove_column    :users, :phone
    remove_column    :users, :company
    remove_column    :users, :gender
    remove_column    :users, :birthdate
    remove_column    :users, :address
    remove_column    :users, :address2
    remove_column    :users, :city
    remove_column    :users, :state
    remove_column    :users, :postal
    remove_column    :users, :dateAdded
    remove_column    :users, :dateUpdated
    remove_column    :users, :dateLastLogin
    remove_column    :users, :link
    remove_column    :users, :expires
    remove_column    :users, :now
  end
end

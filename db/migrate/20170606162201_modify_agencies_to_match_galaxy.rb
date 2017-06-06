class ModifyAgenciesToMatchGalaxy < ActiveRecord::Migration[5.1]
  def change
    rename_column :agencies, :name, :agencyName
    remove_column :agencies, :galaxy_id
    add_column    :agencies, :agencyLink, :string
    add_column    :agencies, :agencyAddress, :string
    add_column    :agencies, :agencyAddress2, :string
    add_column    :agencies, :agencyCity, :string
    add_column    :agencies, :agencyState, :string
    add_column    :agencies, :agencyZip, :string
    add_column    :agencies, :agencyPhone, :string
    add_column    :agencies, :agencyContact, :string
    add_column    :agencies, :agencyURL, :string
    add_column    :agencies, :agencyDescription, :string
    add_column    :agencies, :dateAdded, :string
    add_column    :agencies, :dateUpdated, :string
    add_column    :agencies, :status, :string
  end
end

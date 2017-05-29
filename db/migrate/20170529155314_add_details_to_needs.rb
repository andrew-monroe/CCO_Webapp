class AddDetailsToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :agency, :string
    add_column :needs, :event_start, :datetime
    add_column :needs, :event_end, :datetime
    add_column :needs, :location, :text
    add_column :needs, :volunteers_needed, :integer
    add_column :needs, :volunteers_signed_up, :integer
  end
end

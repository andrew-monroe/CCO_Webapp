class AddNeedLinkToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :need_link, :string
  end
end

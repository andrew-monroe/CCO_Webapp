class RemoveNeedsEndTimes < ActiveRecord::Migration[5.1]
  def change
    remove_column :needs, :start_time
    remove_column :needs, :end_time
    add_column    :needs, :time, :string
  end
end

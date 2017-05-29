class ChangeNeeds < ActiveRecord::Migration[5.1]
  def change
    rename_column :needs, :event_start, :start_time
    rename_column :needs, :event_end, :end_time
  end
end

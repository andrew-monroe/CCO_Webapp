class AddDateAndTimeBackToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :start_time, :time
    add_column :needs, :end_time, :time
    add_column :needs, :date, :date
    add_column :needs, :start_date_time, :datetime
    add_column :needs, :end_date_time, :datetime
  end
end

class ChangeEndTimeTypeToEvent < ActiveRecord::Migration
  def change
    remove_column :events, :end_time
    add_column :events, :end_time, :datetime
  end
end

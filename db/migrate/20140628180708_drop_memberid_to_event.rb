class DropMemberidToEvent < ActiveRecord::Migration
  def change
    remove_column :events, :member_id, :integer
  end
end

class AddMemberidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :member_id, :integer
  end
end

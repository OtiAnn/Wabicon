class AddNodeidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :node_id, :integer
  end
end

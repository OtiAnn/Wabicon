class RemoveUuidFromNode < ActiveRecord::Migration
  def change
    remove_column :nodes, :uuid
  end
end

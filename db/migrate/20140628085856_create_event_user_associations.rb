class CreateEventUserAssociations < ActiveRecord::Migration
  def change
    create_table :event_user_associations do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.integer :number

      t.timestamps
    end
  end
end

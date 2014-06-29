class AddMembersCounterToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_user_associations_count, :integer, :default => 0
    
    # 如果是網站上線後才新增這個功能，這裡需要先計算設定好初始值
    Event.find_each do |event|
      event.update_attribute(:event_user_associations_count, event.event_user_associations.count)
    end
  end
end

class EventUserAssociation < ActiveRecord::Base
  belongs_to :event, :counter_cache => true
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => :event_id }
end

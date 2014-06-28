class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :node
  has_many :event_user_associations, :dependent => :destroy
  has_many :users, :through => :event_user_associations
end

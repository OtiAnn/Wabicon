class User < ActiveRecord::Base
  belongs_to :node
  has_many :event_user_associations
  has_many :events, :through => :event_user_associations
end

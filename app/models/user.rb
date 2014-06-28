class User < ActiveRecord::Base
  belongs_to :node
  has_many :event_user_associations, :dependent => :destroy
  has_many :events, :through => :event_user_associations
end

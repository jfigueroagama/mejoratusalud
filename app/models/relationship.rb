class Relationship < ActiveRecord::Base
  attr_accessible :followed_id
  
  belongs_to :follower_id, class_name: "User"
  belongs_to :followed_id, class_name: "User"
end

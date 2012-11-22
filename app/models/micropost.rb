# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  default_scope order: 'microposts.created_at DESC'
  
  #Array of IDs of users followed by users
  def self.from_users_followed_by(user)
    #followed_ids = user.followed_ids
    followed_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    #where("user_id IN (?) OR user_id = ?", followed_ids, user)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
end

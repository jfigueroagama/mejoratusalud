# == Schema Information
#
# Table name: consultorios
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Consultorio < ActiveRecord::Base
  attr_accessible :name
  #before_save { |consultorio| consultorio.name = name.downcase }
  
  validates :name, presence: true, length: { maximum: 60 }, uniqueness: true #{ case_sensitive: false } 
end

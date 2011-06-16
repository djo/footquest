class UserQuest < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  
  validates :user, :presence => true
  validates :quest, :presence => true
end

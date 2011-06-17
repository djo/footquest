class Quest < ActiveRecord::Base
  attr_accessible :title, :description, :organizers, 
                  :meeting_place, :meeting_at, :start_at, :cost,
                  :user_quests_attributes
  
  has_many :user_quests, :dependent => :destroy
  has_many :users, :through => :user_quests
  
  validates_presence_of :title, :description, :meeting_place, :meeting_at, :start_at
  validates_numericality_of :cost, :greater_than => 0.01, :allow_blank => true
end

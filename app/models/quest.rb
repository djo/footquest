class Quest < ActiveRecord::Base
  attr_accessible :title, :description, :organizers, 
                  :meeting_place, :meeting_at, :start_at, :cost,
                  :user_quests_attributes
  
  has_many :user_quests, :dependent => :destroy
  has_many :users, :through => :user_quests
  
  validates_presence_of :title, :description, :meeting_place, :meeting_at, :start_at
  validates_numericality_of :cost, :greater_than => 0.01, :allow_blank => true
  
  def update_user_quests(user_ids)
    ids = user_ids.map &:to_i
    remove_user_quests(self.user_ids - ids)
    create_user_quests(ids - self.user_ids)
  end
  
  private
  
  def remove_user_quests(user_ids)
    UserQuest.delete_all(:quest_id => id, :user_id => user_ids)
  end
  
  def create_user_quests(user_ids)
    user_ids.each { |id| user_quests.create!(:user_id => id)  }
  end
end

class Comment < ActiveRecord::Base
  belongs_to :quest
  
  attr_accessible :message, :author
  
  validates :quest, :presence => true
  validates :message, :presence => true
  validates :author, :presence => true
end

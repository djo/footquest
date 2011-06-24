class Comment < ActiveRecord::Base
  belongs_to :quest
  
  validates :quest, :presence => true
  validates :message, :presence => true
  validates :author, :presence => true
end

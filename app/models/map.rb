class Map < ActiveRecord::Base
  has_many :placemarks, :dependent => :destroy
  
  belongs_to :user
  belongs_to :quest

  attr_accessible

  validates :user, :presence => true
  validates :quest, :presence => true
end

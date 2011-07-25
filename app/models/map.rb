class Map < ActiveRecord::Base
  has_many :placemarks, :dependent => :destroy
  has_many :polylines, :dependent => :destroy
  
  belongs_to :user
  belongs_to :quest

  attr_accessible

  validates :user, :presence => true
  validates :quest, :presence => true
  validates :lng, :presence => true
  validates :lat, :presence => true
  validates :zoom, :presence => true, :numericality => { :greater_than_or_equal_to => 10, :less_than_or_equal_to => 17 }
end

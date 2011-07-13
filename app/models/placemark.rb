class Placemark < ActiveRecord::Base
  belongs_to :map
  
  validates :name, :presence => true
  validates :lat, :presence => true
  validates :lng, :presence => true
end

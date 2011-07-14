class Polyline < ActiveRecord::Base
  belongs_to :map

  validates :map, :presence => true
  validates :encoded_points, :presence => true
end

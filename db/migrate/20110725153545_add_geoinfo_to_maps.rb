class AddGeoinfoToMaps < ActiveRecord::Migration
  def self.up
    add_column :maps, :lng, :decimal, :precision => 10, :scale => 6, :null => false
    add_column :maps, :lat, :decimal, :precision => 10, :scale => 6, :null => false
    add_column :maps, :zoom, :integer, :default => 12, :null => false
  end

  def self.down
    remove_column :maps, :lng
    remove_column :maps, :lat
    remove_column :maps, :zoom
  end
end

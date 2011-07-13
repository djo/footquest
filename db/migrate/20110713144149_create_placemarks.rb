class CreatePlacemarks < ActiveRecord::Migration
  def self.up
    create_table :placemarks do |t|
      t.integer :map_id, :null => false
      
      t.string :name, :null => false
      t.string :description
      t.string :icon_content
            
      t.decimal :lat, :precision => 10, :scale => 6, :null => false      
      t.decimal :lng, :precision => 10, :scale => 6, :null => false      
            
      t.timestamps
    end
  end

  def self.down
    drop_table :placemarks
  end
end

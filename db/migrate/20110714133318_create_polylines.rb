class CreatePolylines < ActiveRecord::Migration
  def self.up
    create_table :polylines do |t|
      t.integer :map_id, :null => false
      
      t.text :encoded_points, :null => false
      t.string :hint_content
      t.string :stroke_color, :default => 'ff0000ff', :limit => 8, :null => false
      t.integer :stroke_width, :default => 1, :null => false
      
      t.timestamps
    end
    
    add_index :polylines, :map_id
  end

  def self.down
    drop_table :polylines
  end
end

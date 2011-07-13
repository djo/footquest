class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.integer :user_id, :null => false
      t.integer :quest_id, :null => false
      
      t.timestamps
    end
    
    add_index :maps, :user_id
    add_index :maps, :quest_id
  end

  def self.down
    drop_table :maps
  end
end

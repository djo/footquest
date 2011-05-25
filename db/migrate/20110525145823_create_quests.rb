class CreateQuests < ActiveRecord::Migration
  def self.up
    create_table :quests do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :meeting_place, :null => false
      t.datetime :meeting_at, :null => false
      t.datetime :start_at, :null => false
      t.decimal :cost, :precision => 8, :scale => 2
        
      t.timestamps
    end
  end

  def self.down
    drop_table :quests
  end
end

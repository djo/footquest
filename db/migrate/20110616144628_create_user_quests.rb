class CreateUserQuests < ActiveRecord::Migration
  def self.up
    create_table :user_quests do |t|
      t.integer :user_id, :null => false
      t.integer :quest_id, :null => false

      t.timestamps
    end
    
    add_index :user_quests, :user_id
    add_index :user_quests, :quest_id
    add_index :user_quests, [:user_id, :quest_id], :unique => true
  end

  def self.down
    drop_table :user_quests
  end
end

class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :quest_id, :null => false
      t.text :message, :null => false
      t.string :author, :null => false

      t.timestamps
    end
    
    add_index :comments, :quest_id
  end

  def self.down
    drop_table :comments
  end
end

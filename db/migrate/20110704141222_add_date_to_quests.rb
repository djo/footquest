class AddDateToQuests < ActiveRecord::Migration
  def self.up
    add_column :quests, :date, :date, :null => false
    change_column :quests, :start_at, :time, :null => false
    change_column :quests, :meeting_at, :time, :null => false  
  end

  def self.down
    remove_column :quests, :date, :date, :null => false
    change_column :quests, :start_at, :datetime, :null => false
    change_column :quests, :meeting_at, :datetime, :null => false  
  end
end

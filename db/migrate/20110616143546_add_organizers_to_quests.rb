class AddOrganizersToQuests < ActiveRecord::Migration
  def self.up
    add_column :quests, :organizers, :string
  end

  def self.down
    remove_column :quests, :organizers
  end
end

class AddPickupByToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :pickup_by, :date
  end

  def self.down
    remove_column :items, :pickup_by
  end
end

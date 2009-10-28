class AddFineAmountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fine_amount, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :users, :fine_amount
  end
end

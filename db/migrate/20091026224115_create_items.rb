class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.string :type
      t.string :status
      t.date :checkout_date
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :user_id
      t.string :log
      t.boolean :status
      t.text :document

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end

class CreateCplLibraryCards < ActiveRecord::Migration
  def self.up
    create_table :cpl_library_cards do |t|
      t.integer :user_id
      t.string :number
      t.string :zip_code

      t.timestamps
    end
  end

  def self.down
    drop_table :cpl_library_cards
  end
end

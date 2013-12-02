class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.datetime :datetime
      t.integer :wpm
      t.integer :cpm

      t.timestamps
    end
  end
end

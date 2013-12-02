class AddRelationsToPractice < ActiveRecord::Migration
  def change
    change_table :practices do |t|
      t.belongs_to :user
      t.belongs_to :lesson
    end
  end
end

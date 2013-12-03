class RemoveWpmFromUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :WPM
    end
  end
end

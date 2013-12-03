class RemoveDatetimeFromPractice < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :datetime
    end
  end
end

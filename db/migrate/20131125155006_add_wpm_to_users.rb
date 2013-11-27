class AddWpmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :WPM, :integer
  end
end

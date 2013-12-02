# a very basic migration
# adds a new column "WPM" of type integer to the users table
class AddWpmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :WPM, :integer
  end
end

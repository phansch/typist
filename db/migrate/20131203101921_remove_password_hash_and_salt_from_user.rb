class RemovePasswordHashAndSaltFromUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :password_hash, :password_salt
    end
  end
end

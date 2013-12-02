class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :desc
      t.string :text

      t.timestamps
    end
  end
end

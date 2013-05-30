class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :group
      t.date :day_of_week
      t.time :time
      t.integer :price
      t.integer :teacher_id

      t.timestamps
    end
  end
end

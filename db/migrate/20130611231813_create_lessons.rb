class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.time :time
      t.string :day

      t.timestamps
    end
  end
end

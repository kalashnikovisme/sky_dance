class AddTeachersPhotos < ActiveRecord::Migration
  def change
    create_table :teacher_photos do |t|
      t.attachment :photo

      t.timestamps
    end
  end
end

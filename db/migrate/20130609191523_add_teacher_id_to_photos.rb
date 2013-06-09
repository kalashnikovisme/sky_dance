class AddTeacherIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :teacher_id, :integer
  end
end

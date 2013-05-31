class AddTeacherIdToTeacherPhotos < ActiveRecord::Migration
  def change
    add_column :teacher_photos, :teacher_id, :integer
  end
end

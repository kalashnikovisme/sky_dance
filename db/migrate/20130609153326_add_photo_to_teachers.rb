class AddPhotoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :photo, :string
  end
end

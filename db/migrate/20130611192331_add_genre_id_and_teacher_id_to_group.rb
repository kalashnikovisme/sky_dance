class AddGenreIdAndTeacherIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :genre_id, :integer
    add_column :groups, :teacher_id, :integer
  end
end

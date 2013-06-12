class AddGenreIdToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :genre_id, :integer
  end
end

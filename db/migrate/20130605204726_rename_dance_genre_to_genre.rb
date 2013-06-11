class RenameDanceGenreToGenre < ActiveRecord::Migration
  def up
    rename_table :dance_genres, :genres
  end

  def down
    rename_table :genres, :dance_genres
  end
end

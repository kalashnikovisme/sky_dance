class CreateDanceGenres < ActiveRecord::Migration
  def change
    create_table :dance_genres do |t|
      t.string :title
      t.string :description
      t.attachment :photo
      t.string :video_link

      t.timestamps
    end
  end
end

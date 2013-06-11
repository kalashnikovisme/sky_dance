class RemoveVideoLinkFromGenre < ActiveRecord::Migration
  def up
    remove_column :genres, :video_link
  end

  def down
  end
end

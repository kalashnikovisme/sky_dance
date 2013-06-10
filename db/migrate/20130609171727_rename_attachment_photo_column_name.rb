class RenameAttachmentPhotoColumnName < ActiveRecord::Migration
  def up
    rename_column :photos, :file, :photo
  end

  def down
  end
end

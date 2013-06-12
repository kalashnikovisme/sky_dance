class RemoveCategoryFromGroup < ActiveRecord::Migration
  def up
    remove_column :groups, :category
  end

  def down
  end
end

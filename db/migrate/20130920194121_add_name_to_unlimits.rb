class AddNameToUnlimits < ActiveRecord::Migration
  def change
    add_column :unlimits, :name, :text
  end
end

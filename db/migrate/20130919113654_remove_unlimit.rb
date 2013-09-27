class RemoveUnlimit < ActiveRecord::Migration
  def change
    remove_column :groups, :unlimit
  end
end

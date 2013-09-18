class AddUnlimitToGroup < ActiveRecord::Migration
  def change
      add_column :groups, :unlimit, :integer
  end
end

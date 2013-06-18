class AddSpaceToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :space, :string
  end
end

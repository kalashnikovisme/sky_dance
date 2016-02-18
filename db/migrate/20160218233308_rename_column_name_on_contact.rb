class RenameColumnNameOnContact < ActiveRecord::Migration
  def change
    rename_column :contacts, :email, :comment
  end
end

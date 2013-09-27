class CreateUnlimits < ActiveRecord::Migration
  def change
    create_table :unlimits do |t|
      t.integer :price

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :category
      t.integer :once_price
      t.integer :price

      t.timestamps
    end
  end
end

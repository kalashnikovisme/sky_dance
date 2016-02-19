class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :email
      t.text :name
      t.text :phone

      t.timestamps null: false
    end
  end
end
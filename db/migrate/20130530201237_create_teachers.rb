class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :middle_name
      t.text :description
      t.string :motto

      t.timestamps
    end
  end
end

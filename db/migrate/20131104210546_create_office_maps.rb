class CreateOfficeMaps < ActiveRecord::Migration
  def change
    create_table :office_maps do |t|
      t.text :link

      t.timestamps
    end
  end
end

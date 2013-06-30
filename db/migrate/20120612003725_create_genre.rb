class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.text :description
      t.text :photo
      t.string :title
    end
  end
end

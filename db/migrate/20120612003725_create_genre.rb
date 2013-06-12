class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :description
      t.string :photo
      t.string :title
    end
  end
end

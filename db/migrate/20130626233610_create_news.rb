class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :body
      t.date :published_at
      t.string :photo

      t.timestamps
    end
  end
end

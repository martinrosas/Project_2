class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :runtime
      t.string :genre

      t.timestamps null: false
    end
  end
end

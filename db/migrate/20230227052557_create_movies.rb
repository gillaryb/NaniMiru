class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synposis
      t.string :cast
      t.string :genre
      t.integer :rating

      t.timestamps
    end
  end
end

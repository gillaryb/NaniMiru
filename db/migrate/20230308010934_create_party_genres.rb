class CreatePartyGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :party_genres do |t|
      t.references :party, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end

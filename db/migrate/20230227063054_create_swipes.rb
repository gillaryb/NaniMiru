class CreateSwipes < ActiveRecord::Migration[7.0]
  def change
    create_table :swipes do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end

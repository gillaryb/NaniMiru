class AddDefaultValueToSwipes < ActiveRecord::Migration[7.0]
  def change
    change_column :swipes, :status, :integer, default: 0
  end
end

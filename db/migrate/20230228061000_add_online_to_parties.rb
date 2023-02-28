class AddOnlineToParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :parties, :status, :integer
    add_column :parties, :online, :boolean, default: true
  end
end

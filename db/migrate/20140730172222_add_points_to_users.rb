class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, null: false, default: 25
  end
end

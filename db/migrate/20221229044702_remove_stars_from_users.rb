class RemoveStarsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :stars, :integer
  end
end

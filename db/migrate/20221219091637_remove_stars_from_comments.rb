class RemoveStarsFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :stars, :integer
  end
end

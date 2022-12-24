class AddStarsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :stars_count, :integer, default: 0
  end
end

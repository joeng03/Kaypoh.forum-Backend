class DropForums < ActiveRecord::Migration[7.0]
  def change
    drop_table :forums
  end
end

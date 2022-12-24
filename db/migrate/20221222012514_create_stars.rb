class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps

    end

    add_index :stars, [:post_id, :user_id], unique: true
  end
end

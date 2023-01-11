class AddSentimentToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :sentiment, :decimal, default: 0.0
  end
end

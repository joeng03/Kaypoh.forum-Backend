class Comment < ApplicationRecord
    attr_readonly :user_id # Comment author cannot be edited

    # Associations
    belongs_to :user
    belongs_to :post, counter_cache: true
    

    # Sentiment analyzer
    $analyzer = Sentimental.new
    $analyzer.load_defaults
end

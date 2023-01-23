# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

news_urls = {
    # 'CNA'=> 'https://www.channelnewsasia.com/api/v1/rss-outbound-feed?_format=xml&category=10416', 
    # 'Reuters' => 'https://www.reutersagency.com/feed/?taxonomy=best-regions&post_type=best',
    # 'BBC'=> 'https://feeds.bbci.co.uk/news/world/rss.xml', 
    # 'New York Times'=> 'https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml', 
    # 'Al Jazeera'=> 'https://www.aljazeera.com/xml/rss/all.xml',
    'CNBC'=> 'https://www.cnbc.com/id/100727362/device/rss/rss.html'
}
topic_id = 15 # topic 'News'
user_id = 13 # user 'kaypoh'
task :get_rss => :environment do
    news_posts = []
    begin
        news_urls.each do |name, url|
            URI.open(url) do |rss|
                feed = RSS::Parser.parse(rss)
                feed.items.each do |item|
                  news_posts.push(
                    {
                        'title': item.title,
                        'content': item.description + "<p> <a href=#{item.link}>Article link</a> </p>",
                        'topic_id': topic_id,  
                        'user_id': user_id,
                    }
                  )
                end
            end
        end 
        Post.insert_all(news_posts)

        # update posts_count column of topic as counter_cache is not supported in bulk insertions
        Topic.update_counters(topic_id, posts_count: news_posts.length())        
      rescue => e
        puts 'Cron job[Rake task :get_rss] has failed'
      end
    
end
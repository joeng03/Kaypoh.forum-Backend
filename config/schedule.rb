set :output, 'log/whenever.log'

every 1.day do
    rake 'get_rss'
end

# Gets news feed every 24 hours. The frequency of this cron job can be adjusted later
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ENV['VERCEL_ORIGIN'], ENV['NETLIFY_ORIGIN']

      resource '*',
        headers: :any,          
        #expose:['Authentication'],
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
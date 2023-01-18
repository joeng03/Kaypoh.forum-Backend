require 'rack/attack'

class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

#   # Allow all local traffic
#   safelist('allow-localhost') do |req|
#     '127.0.0.1' == req.ip || '::1' == req.ip
#   end

  throttle('req/ip', limit: 100, period: 10) do |req|
    req.ip
  end

  self.throttled_responder = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{error: "Too many requests. Please retry later."}.to_json]
    ]
  }

end
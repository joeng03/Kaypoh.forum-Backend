class StaticController < ApplicationController
  def index
    render xml: File.read(Rails.root.join('public', 'index.html')), content_type: 'text/html'
  end
end

json.extract! news, :id, :img, :title, :url, :created_at, :updated_at
json.url news_url(news, format: :json)

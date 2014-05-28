json.array!(@recommends) do |recommend|
  json.extract! recommend, :id
  json.url recommend_url(recommend, format: :json)
end

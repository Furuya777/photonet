json.array!(@information_contents) do |information_content|
  json.extract! information_content, :id
  json.url information_content_url(information_content, format: :json)
end

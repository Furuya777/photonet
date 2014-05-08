json.array!(@photos) do |photo|
  json.extract! photo, :id, :file_name, :title, :content
  json.url photo_url(photo, format: :json)
end

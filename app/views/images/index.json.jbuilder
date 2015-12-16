json.array!(@images) do |image|
  json.extract! image, :id, :attachment, :name
  json.url image_url(image, format: :json)
end

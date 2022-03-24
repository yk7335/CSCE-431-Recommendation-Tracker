json.extract! image, :id, :uin, :photo, :created_at, :updated_at
json.url image_url(image, format: :json)

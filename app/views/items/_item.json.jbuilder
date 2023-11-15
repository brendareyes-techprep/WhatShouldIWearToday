json.extract! item, :id, :photo_url, :color_hex, :details, :owner_id, :created_at, :updated_at
json.url item_url(item, format: :json)

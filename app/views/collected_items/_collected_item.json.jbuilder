json.extract! collected_item, :id, :product_id, :cart_id, :created_at, :updated_at
json.url collected_item_url(collected_item, format: :json)

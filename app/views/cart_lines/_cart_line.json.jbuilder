json.extract! cart_line, :id, :product_id, :cart_id, :created_at, :updated_at
json.url cart_line_url(cart_line, format: :json)

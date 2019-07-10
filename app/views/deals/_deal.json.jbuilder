json.extract! deal, :id, :title, :description, :price, :discounted_price, :quantity, :publish_date, :created_at, :updated_at
json.url deal_url(deal, format: :json)

json.extract! review, :id, :note, :description, :created_at, :updated_at
json.url review_url(review, format: :json)

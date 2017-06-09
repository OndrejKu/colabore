json.extract! candidature, :id, :introduction_letter, :accepted, :created_at, :updated_at
json.url candidature_url(candidature, format: :json)

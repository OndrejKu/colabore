json.extract! gig, :id, :title, :description, :start_date, :end_date, :number_of_available_candidatures, :available, :created_at, :updated_at
json.url gig_url(gig, format: :json)

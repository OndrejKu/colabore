class Gig < ApplicationRecord
  belongs_to :organization
  validates :organization, :title, :description, :start_date, :end_date, :number_of_available_candidatures, presence: true
end

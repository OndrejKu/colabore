class Candidature < ApplicationRecord
  belongs_to :gig
  belongs_to :volunteer
  validates :gig, :volunteer, presence: true
end

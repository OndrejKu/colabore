class Organization < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :gigs
  has_many :reviews, as: :reviewable
end

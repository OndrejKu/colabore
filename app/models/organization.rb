class Organization < ApplicationRecord
  belongs_to :user
  has_many :gigs
  has_many :reviews, as: :reviewable
end

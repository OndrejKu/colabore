class Organization < ApplicationRecord
  self.per_page = 10
  belongs_to :user
  belongs_to :city
  has_many :gigs
  has_many :reviews, as: :reviewable
  validates :name, :phone, :description, :address, :user, :city, presence: true
end

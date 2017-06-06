class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :candidatures
  has_many :reviews, as: :reviewable
end

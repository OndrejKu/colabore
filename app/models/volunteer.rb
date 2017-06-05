class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :candidatures
  has_many :reviews, as: :reviewable
end

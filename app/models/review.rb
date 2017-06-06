class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  validates :reviewable, :reviewable_type, :note, presence: true
end

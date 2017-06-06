class State < ApplicationRecord
  belongs_to :region
  validates :name, :acronym, :region, presence: true
end

class City < ApplicationRecord
  belongs_to :state
  validates :name, :state, presence: true
  validates_inclusion_of :capital, in: [true, false]
end

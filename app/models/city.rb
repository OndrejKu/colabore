class City < ApplicationRecord
  belongs_to :state
  validates :name, :state, presence: true
  validates_inclusion_of :capital, in: [true, false]

  def to_s
    "#{name} / #{state.acronym}"
  end
end

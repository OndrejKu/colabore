class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum kind: [:Volunteer, :Organization]
  has_one :organization
  has_one :volunteer
  validates :kind, presence: true
end

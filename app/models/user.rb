class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum kind: [:Volunteer, :Organization]
  has_many :organizations
  has_many :volunteers
  validates :kind, presence: true
end

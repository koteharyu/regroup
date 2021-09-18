class Group < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :participating_members, through: :participations, source: :member
  validates :name, presence: true
end

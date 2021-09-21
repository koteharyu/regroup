class Participation < ApplicationRecord
  belongs_to :group
  belongs_to :member

  enum :role, in: { general: 0, organizer: 1 }
end

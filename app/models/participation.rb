class Participation < ApplicationRecord
  belongs_to :group
  belongs_to :member

  enum role: { general: 0, organizer: 1 }
end

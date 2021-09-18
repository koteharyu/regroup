class Member < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :participating_groups, through: :participations, source: :group

  def role(group)
    participations.find_by(group_id: group.id).role
  end

  def join(group)
    participating_groups << group
  end

  def withdraw(group)
    participating_groups.delete(group)
  end
end

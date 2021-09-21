class Group < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :participating_members, through: :participations, source: :member
  # has_many :role, through: :participations
  validates :name, presence: true

  def select_organizer
    participations&.organizer.first
  end

  def select_target_member(current_organizer)
    if current_organizer.nil?
      target_member = participations.sample
    else
      target_member = participations.delete(current_organizer).sample
    end
  end

  def decide_new_organizer(current_organizer, target_member)
    if current_organizer.nil?
      target_member.organizer!
    else
      current_organizer.role = "general"
      target_member.organizer!
    end
  end

  # def decide_new_organizer(current_organizer, target_member)
  #   if current_organizer.nil?
  #     target_member.role(id)
  #   end
  # end
end

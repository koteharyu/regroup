class RolesController < ApplicationController
  before_action :set_group, only: %i[update]

  def update
    current_organizer = @group.select_organizer
    target_member = @group.select_target_member(current_organizer)
    # @group.decide_new_organizer(current_organizer, target_member)
    if current_organizer.nil?
      target_member.organizer!
    else
      target_member.organizer!
      current_organizer.general!
    end
    redirect_to @group, notice: '幹事を設定しました'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end

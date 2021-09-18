class ParticipationsController < ApplicationController
  before_action :set_group, only: %i[create destroy]
  def create
    member = Member.find(params[:member_id])
    member.join(@group)
    redirect_to @group, notice: 'グループに参加しました'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end

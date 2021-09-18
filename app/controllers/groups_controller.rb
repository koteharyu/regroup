class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'created a group'
    else
      render :new
    end
  end

  def show
    @participating_members = @group.participating_members
    @non_participating_members = Member.all - @participating_members.to_a
  end

  def edit

  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'updated a gruop'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy!
    redirect_to groups_path, notice: 'deleted a group'
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

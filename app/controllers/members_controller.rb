class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: 'created a member'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'updated a member'
    else
      render :edit
    end
  end

  def destroy
    @member.destroy!
    redirect_to members_path, notice: 'deleted a member'
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end

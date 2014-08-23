class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    @group.passcode = get_passcode
    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :passcode, :owner)
  end

  def get_passcode
    all_passcode = []
    @groups.each do |group|
      all_passcode << group.passcode
    end
    rand_num(all_passcode)
  end

  def rand_num(existing_passcodes)
    @group_passcode = rand(100000...999999)
    if existing_passcodes.include?(@group_passcode)
      rand_num
    end
    @group_passcode
  end

  # def rand_num
  #   arr = [1,2,3,4,5]
  #   @group_passcode = rand(1...9)
  #   if arr.include?(@group_passcode)
  #     rand_num
  #   end
  #   @group_passcode
  # end

end

class GroupsController < ApplicationController
  def index
    @groups = Group.all

  end

  def show
    @group = Group.find(params[:id])
    @container = Container.where(group: @group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    @user_group = UserGroup.create!(user: current_user, group: @group)
    @group.passcode = get_passcode
    if @group.save

      @container = Container.create!(group: @group)
      #The first group refers to the group_id for the container and the second group refers to the group being created
      make_categories(@container)

      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :passcode, :owner)
  end

  def get_passcode
    all_passcodes = []
    # makes an array with all passcodes 
    if @groups != nil
      @groups.each do |group| 
        all_passcode << group.passcode
      end
    end
    rand_num(all_passcodes)
  end

  def rand_num(existing_passcodes)
    # generate a random number
    group_passcode = rand(100000...1000000)
    # check if the number exists in the array of existing numbers (passed in argument)
    # if it does, try again (call the function)
    # if not, return the generated number
    if existing_passcodes.include?(group_passcode)
      return rand_num(existing_passcodes) 
    end
    group_passcode
  end

  def make_categories(container_id)
    categories = Category.create([
      { name: "Milk", container: container_id
      },
      { name: "Eggs", container: container_id
      },
      { name: "Cheese", container: container_id
      },
      { name: "Meat", container: container_id
      },
      { name: "Fish", container: container_id
      },
      { name: "Vegetables", container: container_id
      },
      { name: "Fruit", container: container_id
      },
      { name: "Leftovers", container: container_id
      },
      { name: "Juice", container: container_id
      },
      { name: "Dairy(other)", container: container_id
      },
      { name: "Alcohol", container: container_id
      },
      { name: "Beverages(other)", container: container_id
      },
      { name: "Frozen", container: container_id
      },
      { name: "Dessert", container: container_id
      },
      { name: "Condiments", container: container_id
      },
      { name: "Bulk/Dried Goods", container: container_id
      },
      { name: "Canned Goods", container: container_id
      },
      { name: "Sauces", container: container_id
      },
      { name: "Spices", container: container_id
      },
      { name: "Other", container: container_id
      },
    ])
  end

end

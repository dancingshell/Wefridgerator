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
      { name: "Dairy", container: container_id, image: "milk"
      },
      { name: "Eggs", container: container_id, image: "eggs"
      },
      { name: "Cheese", container: container_id, image: "cheese"
      },
      { name: "Meat", container: container_id, image: "meat"
      },
      { name: "Fish", container: container_id, image: "fish"
      },
      { name: "Vegetable", container: container_id, image: "vegetable"
      },
      { name: "Fruit", container: container_id, image: "fruit"
      },
      { name: "Leftovers", container: container_id, image: "leftovers"
      },
      { name: "Juice", container: container_id, image: "juice"
      },
      { name: "Liquor", container: container_id, image: "liquor"
      },
      { name: "Beverage", container: container_id, image: "beverage"
      },
      { name: "Frozen", container: container_id, image: "frozen"
      },
      { name: "Dessert", container: container_id, image: "dessert"
      },
      { name: "Condiment", container: container_id, image: "condiment"
      },
      { name: "Bulk/Dried", container: container_id, image: "bulk"
      },
      { name: "Canned", container: container_id, image: "canned"
      },
      { name: "Sauce", container: container_id, image: "sauce"
      },
      { name: "Spice", container: container_id, image: "spice"
      },
      { name: "Other", container: container_id, image: "other"
      },
    ])
 
  end

end

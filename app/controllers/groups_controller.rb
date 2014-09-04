class GroupsController < ApplicationController
  def index
    @groups = Group.all

  end

  def show
    @group = Group.find(params[:id])
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

      #The first group refers to the group_id for the container and the second group refers to the group being created
      make_categories(@group)

      redirect_to group_categories_path(@group)
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

  def make_categories(group_id)
    categories = Category.create([
      { name: "Dairy", group: group_id, image: "milk"
      },
      { name: "Eggs", group: group_id, image: "eggs"
      },
      { name: "Cheese", group: group_id, image: "cheese"
      },
      { name: "Meat", group: group_id, image: "meat"
      },
      { name: "Fish", group: group_id, image: "fish"
      },
      { name: "Vegetable", group: group_id, image: "vegetable"
      },
      { name: "Fruit", group: group_id, image: "fruit"
      },
      { name: "Leftovers", group: group_id, image: "leftovers"
      },
      { name: "Juice", group: group_id, image: "juice"
      },
      { name: "Liquor", group: group_id, image: "liquor"
      },
      { name: "Beverage", group: group_id, image: "beverage"
      },
      { name: "Frozen", group: group_id, image: "frozen"
      },
      { name: "Dessert", group: group_id, image: "dessert"
      },
      { name: "Condiment", group: group_id, image: "condiment"
      },
      { name: "Bulk/Dried", group: group_id, image: "bulk"
      },
      { name: "Canned", group: group_id, image: "canned"
      },
      { name: "Sauce", group: group_id, image: "sauce"
      },
      { name: "Spice", group: group_id, image: "spice"
      },
      { name: "Other", group: group_id, image: "other"
      },
    ])
 
  end

end

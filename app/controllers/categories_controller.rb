class CategoriesController < ApplicationController


  def index
    
      @group = Group.find(params[:group_id])
      @categories = Category.where(:group_id => @group)
      @item = Item.new
      @items = Item.all
      @shopping_list_items = Item.where(:container_type => "Shopping List")
  
  end

  def show
  end

  def new
    @category = Category.new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def item_json
    # @container = Container.find(params[:id])
    @categories = Category.where(:group_id => @group)
    @items = render json: Item.where(category_id: @categories.map(&:id))
  end


end

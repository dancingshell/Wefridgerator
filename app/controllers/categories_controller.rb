class CategoriesController < ApplicationController


  def index
    @container = Container.find(params[:container_id])
    @categories = Category.where(:container => @container)
    @item = Item.new
    @items = Item.all
    @shopping_list_items = Item.where(:container_type => "Shopping List")
    item_filter = params[:itemfilter]
    case item_filter
    when "refridgerator"
      @items = Item.where(:container_type => "Refridgerator")
    when "freezer"
      @items = Item.where(:container_type => "Freezer")
    when "pantry"
      @items = Item.where(:container_type => "Pantry")
    else
      @items = Item.all
    end
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
    @container = Container.find(params[:id])
    @categories = Category.where(:container => @container)
    @items = render json: Item.where(category_id: @categories.map(&:id))
  end


end

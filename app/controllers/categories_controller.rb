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
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.find(params[:id])
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

  def item_filter
    item_filter = params[:itemfilter]
    item_filter.downcase!
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

end

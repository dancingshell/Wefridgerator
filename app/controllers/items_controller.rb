class ItemsController < ApplicationController
  before_action :get_category
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = @category.items.new(item_params)
    if @item.save
      redirect_to category_item_path(@category, @item)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def item_params
    params.require(:item).permit(:name, :category_id)
  end

  def get_category
    @category = Category.find(params[:category_id])
  end
end

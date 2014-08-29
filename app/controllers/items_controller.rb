class ItemsController < ApplicationController
  before_action :get_category, only: [:index, :show, :edit, :create, :update, :destroy]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  # def new
  #   @item = Item.new
  # end

  def new_container_item
    @item = Item.new
    @category = Category.find(params[:id])
  end

  def new_shopping_list_item
    @item = Item.new
    @category = Category.find(params[:id])
  end

  def create
    @item = @category.items.new(item_params)
    @item.user = current_user
    @item.container_type = params[:container_type]
    #This container type refers to the param name we put in the Items show view
    @item.container_type = "Shopping List" if @item.container_type == nil
    #Assigns container type to items dropped in the shopping list
    if @item.save
      
      redirect_to category_item_path(@category, @item)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
  end

  def destroy
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :container_id, :user_id, :exp_date, :quantity, :is_private)
  end

  def get_category
    @category = Category.find(params[:category_id])
  end
end

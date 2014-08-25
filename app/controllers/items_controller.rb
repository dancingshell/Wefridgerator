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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_category
    @category = Category.find(params[:category_id])
  end
end

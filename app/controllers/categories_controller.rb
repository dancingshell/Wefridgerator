class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @item = Item.new
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


end

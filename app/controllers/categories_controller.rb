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

  def check_anagram
    s = params[:s]
    h = Hash.new
    s.chars.uniq.each { |x| h[x] = s.count(x).even? }
    render json: h.values.count(false) <= 1 ? 1 : 0
  end

  def nothing
    render nothing: true
  end


end

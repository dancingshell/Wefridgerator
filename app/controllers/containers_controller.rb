class ContainersController < ApplicationController
      before_action :get_group, only:[:new, :create]

  def index
    @containers = Container.all
  end

  def show
    @container = Container.find(params[:id])
    @categories = Category.all 
  end

  def new
    @container = Container.new
  end

  def create
    @container = @group.containers.new(container_params)
      if @container.save
        redirect_to containers_path
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

  private
  def get_group
    @group = Group.find(params[:group_id])
  end

  def container_params
    params.require(:container).permit(:container_type)
  end

end

class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    binding.pry
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description, :media_type, :tags, :featured_image)
  end
end

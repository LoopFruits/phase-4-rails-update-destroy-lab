class PlantsController < ApplicationController

  
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # PATCH /plants/:id
  def update  
    plant = find_plant
    plant.update(plant_params)
    render json: plant
  end

  #Delete /plants/:id
  def destroy
    # originally added conditional logic , if bird. recieved errors saying 'bird' undefined as a result 
    plant = find_plant
    plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant 
    #issue here, used find at first, then realized I had to use find_by to find the matching id
    Plant.find_by(id: params[:id])
  end

 


end

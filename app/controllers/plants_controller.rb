class PlantsController < ApplicationController

  
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
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
    Plant.find(params[:id])
  end

 


end

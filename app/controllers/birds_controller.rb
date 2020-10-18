class BirdsController < ApplicationController
  #note this will render ONLY the properties of each bird that you want to appear. 
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  #Note: This will add in an error message that appears for the user if a bird doesn't exist. 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

  #note EXCEPT is the opposite of ONLY. It will render everything EXCEPT what you don't want it to:
  # def index
  #   birds = Bird.all
  #   render json: birds, except: [:created_at, :updated_at]
  # end
 
  #Note: this shows all properties of a bird
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird
  # end

  #Note: using slice to render only the properties you want to appear
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

  #Note: manually declaring what properties you want to render:
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end
end
class LocationsController < ApplicationController

    
    def update
        @survivor = Survivor.find(params[:survivor_id])
      if @survivor.infected
        raise "survivor infected cannot update location"
      else
        if @survivor.update_attributes :longitude => params[:longitude], :latitude => params[:latitude]
          render json: @survivor, status: :created
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

    end
     
end

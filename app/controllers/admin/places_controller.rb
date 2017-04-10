module Admin
  class PlacesController < ApplicationController
    before_filter :authenticate_user!
    load_and_authorize_resource
    def index
      @places = Place.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml { render xml: @places }
        format.json { render json: @places }
      end
    end

    def show
      @place = Place.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render xml: @place }
        format.json { render json: @place }
      end
    end

    def new
      @place = Place.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml { render xml: @place }
        format.json { render json: @place }
      end
    end

    def edit
      @place = Place.find(params[:id])
    end

    def create
      @place = Place.new(place_params)

      respond_to do |format|
        if @place.save
          format.html { redirect_to admin_places_path, success: 'Place created successfully.' }
          format.json { render json: @place, status: :created, location: @place }
        else
          format.html { render action: "new", error: "Place could not be created." }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @place = Place.find(params[:id])

      respond_to do |format|
        if @place.update(place_params)
          format.html { redirect_to admin_place_path(@place), success: 'Place updated successfully.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit", error: "Place could not be updated." }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @place = Place.find(params[:id])

      respond_to do |format|
        if @place.destroy
          format.html { redirect_to admin_places_path, success: 'Place deleted successfully.' }
          format.json { head :no_content }
        else
          format.html { redirect_to admin_places_path, error: "Place could not be deleted." }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      end
      # index
    end

    private

      def place_params
        params.require(:place).permit(:name, :address, :latitude, :longitude, :description, :picture, :town, :time, :phone, :email)
      end
  end
end

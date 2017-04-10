class PlacesController < ApplicationController
  # before_filter :authenticate_user!
  # load_and_authorize_resource
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @places }
      format.json { render json: @places }
    end
  end

  def maps
    @places = Place.all
    # render 'all_maps'

    respond_to do |format|
      format.html { render action: "all_maps" }
      format.json { render json: @places }
    end
  end

  def map
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # map.html.erb
      format.xml { render xml: @place }
      format.json { render json: @place }
    end
  end

  def show
    @place = Place.find(params[:id])
    # @items = @place.items
    # @votes = Vote.all
    # @clients = Client.all
    # males = 0
    # females = 0
    # @item_data = []
    # # @item_dates = []
    # @items.each do |item|
    #   @votes.select(:client_id).where(item_id: item.id).each do |vote|
    #     client = @clients.find(vote.client_id)
    #     if client.gender == "male"
    #       males += 1
    #     elsif client.gender == "female"
    #       females += 1
    #     end
    #   end
    #   @item_data << { item_id: item.id, males: males, females: females }
    #   males = 0
    #   females = 0
    #   # @item_dates << @votes.group(:date).count
    # end
    # @item_data

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @place }
      format.json { render json: @place, include: [:items] }
    end
    # puts @item_dates
  end

  def search
    @places = Place.all
    if params[:search]
      @places = Place.search(params[:search]).order('name asc')
    else
      @places = Place.all.order('name asc')
    end
    render json: @places
  end
end

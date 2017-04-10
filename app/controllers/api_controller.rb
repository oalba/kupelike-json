class ApiController < ApplicationController
  def likes
    @item = Item.find(params[:id])

    render json: { votes: @item.votes_count }
  end

  def place
    @place = Place.find(params[:id])
    @items = Item.where(place_id: params[:id])
    @items_all = []
    @items.each do |item|
      @items_all << { name: item.name, picture: item.picture, votes: item.votes_count, year: item.year, description: item.description }
    end
    render json: { name: @place.name, picture: @place.picture, description: @place.description, time: @place.time, address: @place.address, contact: { telephone: @place.phone, email: @place.email }, coordinates: { latitude: @place.latitude, longitude: @place.longitude }, items: @items_all }
  end
end

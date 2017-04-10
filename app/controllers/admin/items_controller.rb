module Admin
  class ItemsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    # def show
    #   @place = Place.find(params[:place_id])
    #   @item = @place.items.find(params[:id])
    # end

    def new
      @place = Place.find(params[:place_id])
      @item = @place.items.build
      respond_to do |format|
        format.html # new.html.erb
        format.xml { render xml: @item }
        format.json { render json: @item }
      end
    end

    def edit
      @place = Place.find(params[:place_id])
      @item = @place.items.find(params[:id])
    end

    def create
      # @item = Item.new(params[:item])
      @place = Place.find(params[:place_id])
      @item = @place.items.build(item_params)
      @item.votes_count = 0
      respond_to do |format|
        if @item.save
          format.html { redirect_to admin_place_path(@place), success: 'Item created successfully.' }
          format.json { render json: @place, status: :created, location: @place }
        else
          format.html { render action: "new", error: "Item could not be created." }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @place = Place.find(params[:place_id])
      @item = @place.items.find(params[:id])

      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to admin_place_path(@place), success: 'Item updated successfully.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit", error: "Item could not be updated." }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @place = Place.find(params[:place_id])
      # @item = @place.items.delete(params[:id])
      respond_to do |format|
        if @place.items.delete(params[:id])
          format.html { redirect_to admin_place_path(@place), success: 'Item deleted successfully.' }
          format.json { head :no_content }
        else
          format.html { redirect_to admin_place_path(@place), error: "Item could not be deleted." }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      end
      # @item.destroy
    end

    def update_year
      @place = Place.find(params[:place_id])
      @item = @place.items.find(params[:item_id])
      @votes = Vote.select(:client_id).where(item_id: @item.id, aviso: true)
      @clients = []
      @votes.each do |vote|
        @clients << Client.find(vote.client_id)
      end

      @clients.each do |client|
        MessageMailer.send_aviso(client, @item, @place).deliver
      end
      Vote.where(item_id: @item.id).update_all(aviso: false)
      @item.increment!("year", 1)
      redirect_to admin_place_path(@place)
    end

    private

      def item_params
        params.require(:item).permit(:name, :description, :picture, :year, :place_id, :votes_count)
      end
  end
end

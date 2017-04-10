class ItemsController < ApplicationController
  # WHY!!!!!?????
  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.json { render json: @item }
    end
  end
end

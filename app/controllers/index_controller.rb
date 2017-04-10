class IndexController < ApplicationController
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @places }
      format.json { render json: @places }
    end
  end

  def gps
    @places = Place.all

    respond_to do |format|
      format.html # gps.html.erb
      format.xml { render xml: @places }
      format.json { render json: @places }
    end
  end
end

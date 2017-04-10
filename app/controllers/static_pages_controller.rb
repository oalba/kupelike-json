class StaticPagesController < ApplicationController
def about_us
    @places = Place.all
    respond_to do |format|
      format.html # about_us.html.erb
      format.xml { render xml: @places }
      format.json { render json: @places }
    end
  end
end

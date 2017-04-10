class PlaceSerializer < ActiveModel::Serializer
  # attributes :name, :picture, :description, :time, :address, :contact { :phone, :email }, :coordinates { :latitude, :longitude }
  attributes :name, :picture, :description, :time, :address, :town, :phone, :email, :latitude, :longitude
  has_many :items
end

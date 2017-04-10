class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :picture, :votes_count, :year, :description
  attribute :statistics do
    object.statistics
  end
end

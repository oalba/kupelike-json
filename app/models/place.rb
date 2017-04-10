class Place < ApplicationRecord
  has_many :items, -> { order(name: :asc) }, dependent: :destroy
  has_many :users, -> { order(name: :asc) }, dependent: :destroy
  def self.search(search)
    where("name ILIKE ? OR town ILIKE ?", "%#{search}%", "%#{search}%")
  end
end

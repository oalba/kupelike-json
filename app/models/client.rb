class Client < ApplicationRecord
  has_many :votes, dependent: :destroy
end

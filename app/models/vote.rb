class Vote < ApplicationRecord
  belongs_to :item
  belongs_to :client
end

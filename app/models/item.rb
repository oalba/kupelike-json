class Item < ApplicationRecord
  belongs_to :place
  has_many :votes, dependent: :destroy
  # after_update_commit do
  #   ItemUpdateEventBroadcastJobJob.perform_later(self)
  # end

  def statistics
    males = 0
    females = 0
    votes.where(item_id: id).each do |vote|
      client = vote.client
      if client.gender == "male"
        males += 1
      elsif client.gender == "female"
        females += 1
      end
    end
    { males: males, females: females }
  end
end

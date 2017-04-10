class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :id, :integer, limit: 8
  end
end

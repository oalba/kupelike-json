class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :votes, :votes_count
  end
end

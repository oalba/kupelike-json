class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :item, foreign_key: true
      t.references :client, foreign_key: true
      t.date :date
      t.boolean :aviso

      t.timestamps
    end
  end
end

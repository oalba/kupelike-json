class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.belongs_to :place, foreign_key: true
      t.string :name
      t.string :surnames
      t.text :address
      t.string :phone
      t.belongs_to :role, foreign_key: true

      t.timestamps
    end
  end
end

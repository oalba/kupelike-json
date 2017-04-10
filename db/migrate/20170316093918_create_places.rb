class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :address
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.string :picture
      t.string :town
      t.text :time
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

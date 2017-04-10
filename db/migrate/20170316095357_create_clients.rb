class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.text :address
      t.date :born_date
      t.string :gender
      t.string :email

      t.timestamps
    end
  end
end

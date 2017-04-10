class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :year
      t.references :place, foreign_key: true
      t.integer :votes

      t.timestamps
    end
  end
end

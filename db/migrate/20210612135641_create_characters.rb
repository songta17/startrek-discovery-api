class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :status
      t.integer :born
      t.string :species
      t.string :planet
      t.string :occupations, array: true, :default => []
      t.string :description
      t.string :gender
      t.string :image
      t.string :episode, array: true, :default => []
      t.string :url

      t.timestamps
    end
  end
end

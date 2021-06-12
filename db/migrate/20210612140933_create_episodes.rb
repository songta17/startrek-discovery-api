class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :air_date
      t.string :episode
      t.string :characters, array: true, :default => []
      t.string :url

      t.timestamps
    end
  end
end

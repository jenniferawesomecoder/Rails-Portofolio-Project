class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.integer :channel_id
      t.string :day
      t.string :time
      t.integer :current_season
      
      t.integer :created_by
      t.timestamps
      
    end
  end
end

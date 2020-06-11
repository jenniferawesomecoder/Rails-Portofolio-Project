class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :watchlist_id
      t.integer :show_id
      t.integer :user_id
      t.string :user_status
      t.integer :user_season
      
      t.boolean :fav, default: false
      t.timestamps
    end
  end
end

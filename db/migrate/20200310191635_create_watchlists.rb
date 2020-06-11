class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
      
    end
  end
end

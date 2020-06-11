class AddShowsCountToChannels < ActiveRecord::Migration[5.2]
  def change

    add_column :channels, :shows_count, :integer

  
  end
end

class Genre < ApplicationRecord
    has_many :show_genres, dependent: :destroy
    has_many :shows, through: :show_genres 
  end
  
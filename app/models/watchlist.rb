class Watchlist < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :listings, dependent: :destroy
    has_many :shows, through: :listings
  
    validates :name, presence: true,  format: { without: /[0-9]/, message: "does not allow numbers" }
  
    before_destroy :destroy_listings
  
    private
    def destroy_listings
      self.listings.each do |listing|
        listing.destroy
      end
    end
  end
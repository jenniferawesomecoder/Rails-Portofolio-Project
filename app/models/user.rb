class User < ApplicationRecord
    has_many :watchlists, dependent: :destroy
    has_many :listings, dependent: :destroy
    has_many :shows, through: :listings
  
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    validate  :is_title_case

    
    has_secure_password

    before_validation :make_title_case
  
    def favorite_shows
      # List the user's shows where fav is true
      self.shows.includes(:listings).where(:listings => { fav: true }).uniq
    end
  
    
 
  private

  def is_title_case
    if username.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:username, "Username must be in title case")
    end
  end
 
  def make_title_case
    # Rails provides a String#titlecase method
    self.username = self.username.titlecase
  end
end
    
    
  

  
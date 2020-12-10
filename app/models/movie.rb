class Movie < ApplicationRecord
  ratyrate_rateable 'movie'
  mount_uploader :picture, PictureUploader
  validate :picture_size
  validate :picture_width

  has_many :movie_directors , dependent: :destroy
  has_many :directors, through: :movie_directors
  has_many :movie_actors , dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :watch, foreign_key: 'movie_id',class_name: 'Watch' , dependent: :destroy
  has_many :users_watched, through: :watch, source: :user
  has_many :watchlist, foreign_key: 'movie_id',class_name: 'Watchlist' , dependent: :destroy
  has_many :users_watchlisted, through: :watchlist,source: :user
  has_many :reviews
  #has_one_attached :image
  
  accepts_nested_attributes_for :directors, allow_destroy: true
  accepts_nested_attributes_for :actors, allow_destroy: true

  def self.watched?(params)
    current_user.watch.find_by(movie_id: params[:id]).nil?
  end

  private

  def picture_width
    image = MiniMagick::Image.open(picture.path)
    if image[:width] < 500 && image[:height] < 500
      errors.add(:picture, "Should be atleast 1000 wide")
    end
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MD")
    end
  end

end
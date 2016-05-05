class Song < ActiveRecord::Base
  belongs_to :artist
  scope :top_songs, -> { order(:crawlDelta => :desc) }


end

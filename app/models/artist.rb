class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy

  def top_songs
    songs.top_songs
  end


end

class SongsController < ApplicationController

  def index
    @songs = Artist.first.top_songs
    respond_to do |format|
      format.json { render :json => @songs }
      format.html
    end
  end

end

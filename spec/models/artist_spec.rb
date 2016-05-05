require 'rails_helper'

RSpec.describe Artist, :type => :model do

  describe '#get_top_songs' do
    let(:artist) {create(:artist_with_100_songs)}

    #TODO
    #Bug:
    #let artist creating and deleting after test, however songs created by them
    #are not getting deleted, so if you change order of this test, it breaks.
    it { expect(artist.top_songs.first).to have_attributes(:crawlDelta => 100) }
    it { expect(artist.top_songs.length).to eq(100) }



  end

end
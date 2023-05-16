require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when the album is on Spotify and can be archived' do
      it 'returns false' do
        album = MusicAlbum.new(true, 'Genre', 'Author', 'Spotify', 'Label')
        expect(album.can_be_archived?).to be(false)
      end
    end

    context 'when the album is not on Spotify' do
      it 'returns false' do
        album = MusicAlbum.new(false, 'Genre', 'Author', 'Source', 'Label')
        expect(album.can_be_archived?).to be(false)
      end
    end

    context 'when the album cannot be archived' do
      it 'returns false' do
        album = MusicAlbum.new(true, 'Genre', 'Author', 'Spotify', 'Label')
        expect(album.can_be_archived?).to be(false)
      end
    end
  end
end

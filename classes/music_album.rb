require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, genre, author, source, label)
    super()
    @on_spotify = on_spotify
    @genre = genre
    @author = author
    @source = source
    @label = label
  end

  def can_be_archived?
    return false if @source != 'Spotify'
    super
  end
end

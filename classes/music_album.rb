require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, source)
    super(source)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return false if @source != 'Spotify'

    super
  end
end

require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, _source)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return false if @source != 'Spotify'

    super
  end

  def to_h
    {
      id: @id,
      archived: @archived,
      genre: @genre,
      published_date: @published_date,
      author: @author,
      source: @source,
      label: @label,
      on_spotify: @on_spotify
    }
  end
end

require_relative './item'

class MusicAlbum < Item
    attr_reader :on_spotify

    def initialize(on_spotify)
        super()
        @on_spotify = on_spotify
    end
end
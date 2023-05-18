require_relative '../classes/item'
require 'time'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super == true && @last_played_at < (Time.now - (365 * 2 * 24 * 60 * 60))
  end

  def to_h
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end
end

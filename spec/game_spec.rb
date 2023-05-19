require_relative '../classes/game'

RSpec.describe Game do
  describe '#can_be_archived?' do
    it 'returns true when last played over 2 years ago' do
      last_played_at = Time.now - (365 * 2 * 24 * 60 * 60) - 1
      game = Game.new(false, last_played_at)
      expect(game.can_be_archived?).to be false
    end

    it 'returns false when last played within 2 years' do
      last_played_at = Time.now - (365 * 2 * 24 * 60 * 60) + 1
      game = Game.new(true, last_played_at)
      expect(game.can_be_archived?).to be false
    end
  end
end

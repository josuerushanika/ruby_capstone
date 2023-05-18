require_relative '../classes/item'
require_relative '../classes/game'


RSpec.describe Game do
  let(:last_played_at) { Time.now - (365 * 2 * 24 * 60 * 60) - 1 }
  let(:game) { Game.new(true, last_played_at) }

  describe "#can_be_archived?" do
    it "returns true when super class can be archived and last played over 2 years ago" do
      expect(game.can_be_archived?).to be true
    end

    it "returns false when super class cannot be archived" do
      game.archived = false
      expect(game.can_be_archived?).to be false
    end

    it "returns false when last played within 2 years" do
      last_played_at = Time.now - (365 * 2 * 24 * 60 * 60) + 1
      game.last_played_at = last_played_at
      expect(game.can_be_archived?).to be false
    end
  end
end

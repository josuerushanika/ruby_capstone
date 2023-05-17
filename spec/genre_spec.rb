require_relative '../classes/genre'
require_relative '../classes/item'

RSpec.describe Genre do
  describe '#add_item' do
    it "sets the genre of an Item class' instance to the instance of the Genre class" do
      genre = Genre.new('Action')
      item = Item.new
      genre.add_item(item)

      expect(item.genre).to eq(genre)
    end
  end
end

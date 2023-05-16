require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  context '#initialize' do
    it 'creates a new instance of the Genre class' do
      genre = Genre.new('action')
      expect(genre).to be_an_instance_of(Genre)
    end
  end

  context '#add_item' do
    it 'sets the genre of an Item class\' instance to the instance of the Genre class' do
      genre = Genre.new('action')
      item = Item.new('2012/08/10')
      genre.add_item(item)
      expect(item.genre).to eq(genre)
      expect(genre.items).to include(item)
    end
  end
end

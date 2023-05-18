require_relative '../classes/author'
require_relative '../classes/item'


RSpec.describe Author do
  let(:author) { Author.new("josue", "Obed") }

  describe "#add_item" do
    it "adds a new item to the author's collection" do
      author.add_item
      expect(author.items.length).to eq(1)
      expect(author.items.first).to be_an_instance_of(Item)
      expect(author.items.first.author).to eq(author)
    end
  end
end


class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end

  def to_h
    {
      id: @id,
      name: @name,
      items: @items
    }
  end
end

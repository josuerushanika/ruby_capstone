require './item'
class Label < Item
  attr_reader :id

  def initialize(title, color)
    super()
    @id = rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end


  private

  attr_reader :items
end

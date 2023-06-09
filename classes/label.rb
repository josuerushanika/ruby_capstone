require_relative '../classes/item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

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

  def to_h
    {
      title: @title,
      color: @color,
      id: @id,
      items: @items
    }
  end
end

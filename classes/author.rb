require_relative '../classes/item'

class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item
    item = Item.new
    item.author = self
    @items.push(item)
  end

  def to_h
    {
      first_name: @first_name,
      last_name: @last_name
    }
  end
end

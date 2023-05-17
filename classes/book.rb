require_relative '../classes/item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super == true || @cover_state == 'bad'
  end
end

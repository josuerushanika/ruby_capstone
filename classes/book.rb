require './item'

class Book < Item
  attr_accessor :cover_state, :publisher

  initialize(publisher, cover_state)
  @publisher = publisher
  @cover_state = cover_state

  def can_be_archived?
    super == true || @cover_state == 'bad'
  end
end

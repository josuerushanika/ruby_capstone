require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize(genre, author, source, label, published_date)
    @id = rand(1..100)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    return false if @published_date.nil?

    (Date.today.year - Date.parse(@published_date).year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been moved to archived.'
    else
      puts 'Item cannot be moved to archived.'
    end
  end
end

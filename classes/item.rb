require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize
    @id = rand(1..100)
    @archived = false
  end

  def can_be_archived?
    return false if @published_date.nil?
  
    Date.today.year - Date.parse(@published_date).year > 10
  end
  

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been moved to the archive.'
    else
      puts 'Item cannot be moved to the archive.'
    end
  end
end

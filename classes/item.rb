class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize()
    @id = rand(1..300)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = @date
    @archived = false
  end

  # private :can_be_archived?

  def can_be_archived?
    return false if @published_date.nil?

    Date.today.year(-Date.parse(@published_date).year > 10)
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has not been moved to archieved'
    else
      puts 'Item has not been moved to archeived'
    end
    @archived = can_be_archived?
  end

  private :can_be_archived?
end

require './classes/book'
require './classes/label'

class App
  def initialize
    @books = []
    @labels = Label.new()
  end

  def list_books
    return 'no book at the moment' if @books.empty?

    result = ''
    @books.each_with_index do |book, index|
      result += "#{index}) Name: #{book.publisher} #{book.cover_state}"
    end
    print result
  end

  def list_labels
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'cover_state: '
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    @books << book
    print 'Book added succesfully'
  end
end

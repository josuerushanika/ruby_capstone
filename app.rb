require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/item'
require_relative './storage/store'
require_relative './classes/music_album'
require_relative './classes/genre'

class App
  def initialize
    @books = []
    @labels = []
  end

  def list_books
    json_data = read_data('./storage/book.json')
    @books = JSON.parse(json_data)
    return 'no book at the moment' if @books.empty?

    result = ''
    @books.each_with_index do |book, index|
      result += "#{index}) Name: #{book['publisher']} #{book['cover_state']}"
    end
    print result
  end

  def list_labels
    json_data = read_data('./storage/label.json')
    @labels = begin
      JSON.parse(json_data)
    rescue StandardError
      []
    end
    if @labels.empty?
      puts 'No label at the moment. You can add one now'
      add_labels
    else
      @labels.each do |label|
        puts "Label ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
      end
    end
  end

  def add_labels
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    write_data(@labels, './storage/label.json')
    print 'label added successfully'
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'cover_states: '
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    @books << book
    write_data(@books, './storage/book.json')
    print 'Book added succesfully'
  end
end

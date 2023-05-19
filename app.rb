require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/item'
require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/preserve_data'
require_relative './storage/store'
require_relative './classes/author'
require_relative './classes/game'
require 'date'

class App
  def initialize
    @books = []
    @labels = []
    @music_album = []
    @genre = []
    @authors = []
    @games = []
  end

  def list_books
    json_data = read_data('./storage/book.json')
    @books = JSON.parse(json_data)
    return 'no book at the moment' if @books.empty?

    result = ''
    @books.each_with_index do |book, index|
      result += "#{index}) Name: #{book['publisher']} #{book['cover_state']}"
    end
    puts result
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
    puts 'label added successfully'
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'cover_states: '
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    @books << book
    write_data(@books, './storage/book.json')
    puts 'Book added succesfully'
  end

  def list_authors
    json_data = read_data('./storage/author.json')
    @authors = begin
      JSON.parse(json_data)
    rescue StandardError
      []
    end
    if @authors.empty?
      puts 'No author added yet'
      add_authors
    else
      @authors.each do |author|
        puts "Author: #{author['first_name']}, #{author['last_name']}"
      end
    end
  end

  def add_authors
    print 'Enter your First name: '
    first_name = gets.chomp
    print 'Enter your Last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    write_data(@authors, './storage/author.json')
    puts 'author added succesfully'
  end

  def add_game
    print 'Enter players: '
    multiplayer = gets.chomp
    print 'Enter last played at (YYYY-MM-DD): '
    date_input = gets.chomp
    last_played_at = Date.parse(date_input)
    game = Game.new(multiplayer, last_played_at)
    @games << game
    write_data(@games, './storage/game.json')
    puts 'Game successfully added'
  end

  def list_games
    json_data = read_data('./storage/game.json')
    @games = JSON.parse(json_data)
    if @games.empty?
      print 'no game added yet'
    else
      @games.each do |game|
        puts "Players: #{game['multiplayer']}, Last Played: #{game['last_played_at']}"
      end
    end
  end

  def create_genre
    puts 'Enter genre:'
    genre = gets.chomp
    @genre << Genre.new(genre)
    write_file(@genre, './storage/genre.json')
  end

  def add_music_album
    puts 'Is music album available on spotify: [y/n]'
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 'y'
    puts 'Enter year of pulication for album: [yyyy/mm/dd]'
    publish_date = Date.parse(gets.chomp)
    @music_album << MusicAlbum.new(on_spotify, publish_date)
    write_file(@music_album, './storage/music_albums.json')
    puts 'Created music album successfully'
  end

  def list_music_album
    @music_album = read_file('./storage/music_albums.json')
    @music_album.each do |album|
      puts "Music_Album_ID: #{album['object_id']}  on_spotify:
      #{album['on_spotify']} publish_date; #{album['publish_date']}"
    end
  end

  def list_genre
    @genre = read_file('./storage/genre.json')
    @genre.each do |genre|
      puts "GenreID: #{genre['object_id']} genre_name: #{genre['name']}"
    end
  end
end

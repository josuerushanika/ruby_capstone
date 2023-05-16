class Main
  def menu_options
    "
      1 - list all books
      2 - list all music albums
      3 - list all movies
      4 - list all genres
      5 - list all labels
      6 - list all authors
      7 - list all sources
      8 - Add a book
      9 - Add a music album
      10 - Add a movie
      0 - Exit
      Please enter a number between 0 and 10 to choose an option
      "
  end

  def choices
    loop do
      input = numeric_input(menu_options, (0..10))
      case input
      when 1
        list_books
      when 2
        list_music_albums
      when 3
        list_movies
      when 4
        list_genres
      when 5
        list_labels
      when 6
        list_authors
      when 7
        list_sources
      when 8
        add_book
      when 9
        add_music_album
      when 10
        add_movie
      end
    end
  end

  def main
    puts 'WELCOME USER'
    choices
  end
end

main = Main.new
main.main

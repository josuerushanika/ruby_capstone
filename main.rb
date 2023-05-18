require './app'

class Main
  def menu_options
    "
      1 - list all books
      2 - list all music albums
      3 - list all games
      4 - list all genres
      5 - list all labels
      6 - list all authors
      7 - list all sources
      8 - Add a book
      9 - Add a music album
      10 - Add a game
      0 - Exit
      Please enter a number between 0 and 10 to choose an option
      "
  end

  def choices
    app = App.new
    menu_selection = {
      '1' => :list_books, '2' => :list_music_albums,
      '3' => :list_games, '4' => :list_genres,
      '5' => :list_labels, '6' => :list_authors,
      '7' => :list_sources, '8' => :add_book,
      '9' => :add_music_album, '10' => :add_game,
      '0' => :exit
    }

    loop do
      puts menu_options
      input = gets.chomp
      break unless menu_selection.key?(input)

      action = menu_selection[input]
      app.send(action) if action
    end
  end

  def main
    puts 'WELCOME USER'
    choices
  end
end

main = Main.new
main.main

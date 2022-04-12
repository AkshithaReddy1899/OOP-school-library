require './app'

class Main
  def initialize
    @app = App.new
  end

  def menu
    puts 'Welcome to School Library App!'
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    options
  end

  def options
    case @app.input
    when '1' then @app.list_all_books
    when '2' then @app.list_all_people
    when '3' then @app.create_a_person
    when '4' then @app.create_a_book
    when '5' then @app.create_a_rental
    when '6' then @app.list_all_rentals_for_person_id
    else
      puts 'Enter a number between 1 and 6'
      puts menu
    end
  end
end

Main.new.menu

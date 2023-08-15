require './app'

class Menu
  def initialize(app)
    @app = app
  end

  def display
    puts 'Welcome to School Library App!'
    loop do
      display_menu
      option = gets.chomp.to_i
      handle_option(option)
      break if option == 7
    end
  end

  private

  def display_menu
    puts '1. List Books'
    puts '2. List People'
    puts '3. Create Person'
    puts '4. Create Book'
    puts '5. Create Rental'
    puts '6. List Rentals for a Person'
    puts '7. Exit'
    print 'Please select an option: '
  end

  def handle_option(option)
    option_actions = {
      1 => -> { @app.list_books },
      2 => -> { @app.list_people },
      3 => -> { @app.create_person },
      4 => -> { @app.create_book },
      5 => -> { @app.create_rental },
      6 => -> { @app.list_rentals_for_person },
      7 => -> { @app.exit_app },
      default: -> { puts 'Enter a number between 1 and 7.' }
    }

    action = option_actions[option] || option_actions[:default]
    action.call
  end
end

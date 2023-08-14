class Menu
  OPTIONS = {
    1 => :list_books_option,
    2 => :list_people_option,
    3 => :create_person_option,
    4 => :create_book_option,
    5 => :create_rental_option,
    6 => :list_rentals_option,
    7 => :exit_app_option
  }.freeze

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
    if OPTIONS[option]
      send(OPTIONS[option])
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def list_books_option
    @app.list_books
  end

  def list_people_option
    @app.list_people
  end
end

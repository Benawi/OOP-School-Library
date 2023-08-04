require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  main_menu(app)
end

def main_menu(app)
  loop do
    app.display_menu
    option = gets.chomp.to_i

    handle_option(app, option)
    break if option == 7
  end
end

def handle_option(app, option)
  options = {
    1 => :list_books_option,
    2 => :list_people_option,
    3 => :create_person_option,
    4 => :create_book_option,
    5 => :create_rental_option,
    6 => :list_rentals_option,
    7 => :exit_app_option
  }

  if options[option]
    send(options[option], app)
  else
    puts 'Invalid option. Please try again.'
  end
end


main
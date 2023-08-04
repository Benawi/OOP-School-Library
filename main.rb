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

def list_books_option(app)
  app.list_books
end

def list_people_option(app)
  app.list_people
end

def create_person_option(app)
  puts 'Create a Student (1) or a Teacher (2)? [Input the number]:'
  person_type = gets.chomp.to_i

  case person_type
  when 1
    app.create_student
  when 2
    app.create_teacher
  else
    puts 'Invalid option. Please try again.'
  end
end

def create_book_option(app)
  app.create_book
end

def create_rental_option(app)
  app.create_rental
end

def list_rentals_option(app)
  app.list_rentals_for_person
end

def exit_app_option(_app)
  puts 'Thank you for using this App.'
end

main

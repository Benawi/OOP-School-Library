require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
  end

  def display_menu
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit'
    print 'Enter the option number: '
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      puts "\nList of Books:"
      @books.each_with_index do |book, index|
        puts "#{index}. Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

end
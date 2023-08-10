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

  def list_people
    if @people.empty?
      puts 'No people available.'
    else
      puts "\nList of People:"
      @people.each_with_index do |person, index|
        puts "#{index}. [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_student
    print "Enter the student's age: "
    age = gets.chomp.to_i

    print "Enter the student's name: "
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = %w[y yes].include?(parent_permission_input)

    student = Student.new(name: name, age: age, parent_permission: parent_permission)
    @people << student

    puts "Student created successfully! (ID: #{student.id})"
  end

  def create_teacher
    print "Enter the teacher's age: "
    age = gets.chomp.to_i

    print "Enter the teacher's name: "
    name = gets.chomp

    print "Enter the teacher's specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(specialization, name: name, age: age)
    @people << teacher

    puts "Teacher created successfully! (ID: #{teacher.id})"
  end

  def create_book
    print "Enter the book's title: "
    title = gets.chomp
    print "Enter the book's author: "
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully!'
  end

  def create_rental
    if @people.empty? || @books.empty?
      puts 'No people or books available to create a rental.'
      return
    end

    puts 'Select the book for the rental:'
    list_books
    print 'Select a book from the following list by number: '
    book_index = gets.chomp.to_i

    book = @books[book_index]

    if book.nil?
      puts 'Invalid book index.'
      return
    end

    puts 'Select the person for the rental:'
    list_people
    print 'Select a person from the following list by number (not id): '
    person_index = gets.chomp.to_i

    person = @people[person_index]

    if person.nil?
      puts 'Invalid person index.'
      return
    end

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp

    person.add_rental(date, book)

    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    if @people.empty?
      puts 'No people available to list rentals.'
      return
    end

    person = select_person_to_list_rentals
    return unless person

    if person.rentals.empty?
      puts "No rentals found for #{person.class.name}: #{person.name} (ID: #{person.id})."
    else
      puts "\nRentals for #{person.class.name}: #{person.name} (ID: #{person.id})"
      list_person_rentals(person)
    end
  end

  private

  def select_book_for_rental
    puts 'Select the book for the rental:'
    list_books
    print 'Select a book from the following list by number: '
    book_index = gets.chomp.to_i

    book = @books[book_index]

    if book.nil?
      puts 'Invalid book index.'
      return nil
    end

    book
  end

  def select_person_for_rental
    puts 'Select the person for the rental:'
    list_people
    print 'Select a person from the following list by number (not id): '
    person_index = gets.chomp.to_i

    person = @people[person_index]

    if person.nil?
      puts 'Invalid person index.'
      return nil
    end

    person
  end

  def input_rental_date
    print 'Date (YYYY-MM-DD): '
    gets.chomp
  end

  def select_person_to_list_rentals
    puts 'Select the person ID to list rentals:'
    list_people
    print 'Enter the person ID: '
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Invalid person ID.'
      return nil
    end

    person
  end

  def list_person_rentals(person)
    person.rentals.each_with_index do |rental, index|
      puts "#{index + 1}. #{rental.book.title}, rented on #{rental.date}"
    end
  end

  public

  def exit_app
    puts 'Thank you for using this App.'
    exit
  end
end

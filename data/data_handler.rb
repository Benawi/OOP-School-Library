require 'json'

class DataHandler
  def initialize(data_manager, rentals_json_file)
    @data_manager = data_manager
    @rentals_json_file = rentals_json_file
  end

  def save_people_to_json(people)
    people_data = people.map(&:to_hash)
    begin
      @data_manager.save_to_json('./data/people.json', people_data)
      puts 'People data saved to people.json Successfully'
    rescue StandardError => e
      puts "Error saving file to JSON: #{e.message}"
    end
  end

  def load_people_from_json
    people_data = @data_manager.load_from_json('./data/people.json')
    loaded_people = []

    people_data.each do |person_data|
      if person_data[:type] == 'Student'
        loaded_people << Student.new_from_hash(person_data)
      elsif person_data[:type] == 'Teacher'
        loaded_people << Teacher.new_from_hash(person_data)
      end
    end
    loaded_people
  rescue StandardError => e
    puts "Error loading from JSON: #{e.message}"
    []
  end

  def save_rentals_to_json(people)
    rentals_data = people.map do |person|
      person.rentals.map do |rental|
        {
          person_id: person.id,
          book_title: rental.book.title,
          rental_date: rental.date
        }
      end
    end.flatten

    @data_manager.save_to_json(@rentals_json_file, rentals_data)
  end

  def load_rentals_from_json(people, books)
    return unless File.exist?(@rentals_json_file)

    rentals_data = JSON.parse(File.read(@rentals_json_file))
    rentals_data.each do |rental_info|
      person = people.find { |p| p.id == rental_info['person_id'] }
      book = books.find { |b| b.title == rental_info['book_title'] }
      next unless person && book

      rental = Rental.new(rental_info['rental_date'], book, person)
      person.add_existing_rental(rental)
    end
  end
end

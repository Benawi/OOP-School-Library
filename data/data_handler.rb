require 'json'

class DataHandler
  def initialize(data_manager)
    @data_manager = data_manager
  end

  def save_people_to_json(people)
    people_data = people.map(&:to_hash)
    @data_manager.save_to_json('people.json', people_data)
    puts 'People data saved to people.json Successfully'
  end

  def load_people_from_json
    people_data = @data_manager.load_from_json('people.json')
    loaded_people = []

    people_data.each do |person_data|
      if person_data[:type] == 'Student'
        loaded_people << Student.new_from_hash(person_data)
      elsif person_data[:type] == 'Teacher'
        loaded_people << Teacher.new_from_hash(person_data)
      end
    end
    loaded_people
  end
end

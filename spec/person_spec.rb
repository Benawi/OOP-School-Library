require_relative '../person'
require 'rspec'

RSpec.describe Person do
  describe 'On instantiating the class' do
    it 'creates a person object with the provided attributes' do
      person = Person.new(name: 'Bob', age: 25)
      expect(person.name).to eq('Bob')
      expect(person.age).to eq(25)
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'Returns correct name of the person created' do
      person = Person.new(name: 'Everlyn')
      expect(person.correct_name).to eq('Everlyn')
    end
  end

  describe '#can_use_services' do
    it 'returns true if person age > 18' do
      person = Person.new(age: 20)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if person has parent_permission' do
      person = Person.new(age: 5, parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end
    
    it 'returns false if the person age < 18 && parent_permission: false' do
    person = Person.new(age: 15, parent_permission: false)
    expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#add_rental method' do
    it 'Adds a rental to the person and associated book' do
      person = Person.new
      book = instance_double('Book')
      expect(book).to receive(:add_rental)

      rental = person.add_rental('2023-08-16', book)
      expect(person.rentals).to include(rental)
    end
  end
end

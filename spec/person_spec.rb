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
end

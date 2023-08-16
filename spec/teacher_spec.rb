require_relative '../teacher'
require 'rspec'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher with the provided attributes' do
      teacher = Teacher.new(name: 'Brian', age: 35, specialization: 'Math')
      expect(teacher.name).to eq('Brian')
      expect(teacher.age).to eq(35)
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(true)
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math')
    end
  end

   describe 'new_from_hash method' do
    it 'creates a new teacher from a hash from data file' do
      hash = { name: 'Bob', age: 45, specialization: 'History' }
      teacher = Teacher.new_from_hash(hash)
      expect(teacher.name).to eq('Bob')
      expect(teacher.age).to eq(45)
      expect(teacher.instance_variable_get(:@specialization)).to eq('History')
    end
  end

   describe '#to_hash' do
    it 'returns a hash representation of the teacher to data file' do
      teacher = Teacher.new(name: 'Eve', age: 40, specialization: 'Science')
      hash = teacher.to_hash
      expect(hash).to include(
        type: 'Teacher',
        age: 40,
        name: 'Eve',
        parent_permission: true,
        specialization: 'Science'
      )
    end
  end
end


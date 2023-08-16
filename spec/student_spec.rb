require_relative '../student'
require 'rspec'

RSpec.describe Student do
  describe '#initialize method' do
    it 'Creates a new student with provided attr' do
      student = Student.new(name: 'Abel', age: 16)
      expect(student.name).to eq('Abel')
      expect(student.age).to eq(16)
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#new_from_hash method' do
    it 'creates a new student from Hash' do
      hash = { name: 'Bob', age: 12, parent_permission: true }
      student = Student.new_from_hash(hash)
      expect(student.name).to eq('Bob')
      expect(student.age).to eq(12)
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#to_hash method' do
    it 'returns a hash representation of the student on save to data file' do
      student = Student.new(name: 'Eve', age: 15)
      hash = student.to_hash
      expect(hash).to include(
        type: 'Student',
        age: 15,
        name: 'Eve',
        parent_permission: true,
        classroom: []
      )
    end
  end

  describe '#play_hooky method' do
    it 'returns the play hooky message' do
      student = Student.new(name: 'Charlie', age: 18)
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom= method' do
    it 'assigns/adds the student to the classroom' do
      student = Student.new(name: 'David', age: 16)
      classroom = Classroom.new('Class one')
      student.classroom = classroom

      expect(classroom.students).to include(student)
    end
  end
end

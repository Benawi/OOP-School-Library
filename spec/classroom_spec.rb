require_relative '../classroom'
require_relative '../student'

describe Classroom do
  classroom = Classroom.new('A')
  student = Student.new(age: 19, name: 'Sahalu')

  it 'should have a label' do
    expect(classroom.label).to eq('A')
  end

  it 'should have a list of students' do
    classroom.add_student(student)

    expected_student_attributes = [{
      name: 'Sahalu', age: 19
    }]

    actual_student_attributes = classroom.students.uniq { |s| [s.name, s.age] }.map { |s| { name: s.name, age: s.age } }
    expect(actual_student_attributes).to match_array(expected_student_attributes)
  end
end

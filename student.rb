require_relative 'person'

class Student < Person
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

student = Student.new(age: 18, parent_permission: true, classroom: '7-B')

puts student.play_hooky

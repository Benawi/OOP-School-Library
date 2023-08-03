require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

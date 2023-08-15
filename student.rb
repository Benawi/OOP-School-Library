require_relative 'person'

class Student < Person
  def initialize(age:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = []
  end

  def self.new_from_hash(hash)
    new(age: hash[:age], name: hash[:name], parent_permission: hash[:parent_permission])
  end

  def to_hash
    super.merge(classroom: @classroom)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

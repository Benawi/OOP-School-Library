require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# Create a object with age < 18 and parent permission == false so if the method
# is correctly overridden the return should be true

teacher = Teacher.new(name: 'Matilda', age: 17, parent_permission: false, specialization: 'math teacher')

puts teacher.can_use_services?
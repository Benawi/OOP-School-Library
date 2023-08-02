require 'corrector'
class Person
  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  @corrector = Corrector.new
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    is_of_age? || @parent_permission
  end
  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
test = Person.new(name: 'benawi', age: 18)

puts test.name

test.validate_name

puts test.name
require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(parent_permission: true, name: 'Unknown', age: nil)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.add_rental(rental)
    rental
  end

  def to_hash
    {
      type: self.class.name,
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end

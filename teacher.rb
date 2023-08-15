require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def self.new_from_hash(hash)
    new(age: hash[:age], specialization: hash[:specialization], name: hash[:name])
  end

  def to_hash
    super.merge(specialization: @specialization)
  end

  def can_use_services?
    true
  end
end

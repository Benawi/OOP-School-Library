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
end


require_relative '../capitalize_decorator'
require_relative '../person'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name of a person' do
      person = Person.new(name:'benawi alex', age:25)
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('Benawi alex')
    end

    it 'does not modify the original name' do
      person = Person.new(name:'Jane smith', age:25)
      decorator = CapitalizeDecorator.new(person)
      decorator.correct_name
      expect(person.name).to eq('Jane smith')
    end
  end
end
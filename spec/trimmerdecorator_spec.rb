require_relative '../trimmerdecorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    person = Person.new(age:21, name:'Georgexyztiuriop')
    @trimmer = TrimmerDecorator.new(person)
  end

  context '#new' do
    it 'returns a new trimmer_decorator object' do
      expect(@trimmer).to be_an_instance_of TrimmerDecorator
    end

    it 'raise ArgumentError when given fewer parameters than 1' do
      expect { TrimmerDecorator.new }.to raise_error ArgumentError
    end
  end

  context '#correct_name' do
    it 'returns a name with 10 characters maximum' do
      expect(@trimmer.correct_name.length).to be <= 10
    end
  end
end
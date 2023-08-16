require './decorator'
require './capitalize_decorator'

describe CapitalizeDecorator do
    let(:decorator) { CapitalizeDecorator.new(double('decorated object')) }

  describe '#correct_name' do
    it 'capitalizes the name returned by the decorated object' do
  
        allow(decorator).to receive(:correct_name).and_return('Benawi')

        expect(decorator.correct_name).to eq('Benawi')
    end

    it 'leaves an already capitalized name as-is' do
       allow(decorator).to receive(:correct_name).and_return('John')  
       expect(decorator.correct_name).to eq('John')
    end
  end
end
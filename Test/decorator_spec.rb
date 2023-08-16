require './nameable'
require './decorator'

describe Decorator do
  context 'when decorating a Nameable object' do
    it 'should delegate correct_name method to the wrapped Nameable object' do
      nameable = double('nameable')
      decorator = Decorator.new(nameable)

      allow(nameable).to receive(:correct_name).and_return('Habtamu Alex')

      expect(decorator.correct_name).to eq('Habtamu Alex')
    end
  end
end

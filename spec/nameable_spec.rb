require './nameable'

describe Nameable do
  context 'When implemeting correct name' do
    it 'should raise NotImplementedError' do
      oc = Nameable.new
      expect { oc.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

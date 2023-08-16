require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  book = Book.new('Title', 'Author')
  person = Person.new(name: 'John Doe', age: 25)
  rental_date = '2023-08-16'
  rental = Rental.new(rental_date, book, person)

  context 'When Initializing' do
    it 'should have a date, book, and person' do
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  context 'Attributes Access' do
    it 'should not allow changing the book attribute' do
      new_book = Book.new('New Title', 'New Author')
      expect { rental.book = new_book }.to raise_error(NoMethodError)
    end

    it 'should not allow changing the person attribute' do
      new_person = Person.new(name: 'Jane Smith', age: 30)
      expect { rental.person = new_person }.to raise_error(NoMethodError)
    end
  end
end

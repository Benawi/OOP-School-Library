require_relative '../book.rb'
require_relative '../person.rb'

describe Book do
  book = Book.new('Title', 'Author')
  person = Person.new(name: 'John Doe', age: 25)
  rental_date = '2023-08-16'

  context 'When Initializing' do
    it 'should have a title and an author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end
  end

  context 'When adding a rental' do
    it 'adds a rental to the person and book' do
      rental = person.add_rental(rental_date, book)
      
      expect(book.rentals).to include(rental)
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  context '#to_hash method' do
    it 'returns a hash with the book attributes' do
      expect(book.to_hash).to eq({
        'title' => 'Title',
        'author' => 'Author',
        'rentals' => [{'date' => rental_date}]
      })
    end
  end
end
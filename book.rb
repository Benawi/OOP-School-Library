require 'json'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental
  end
end

def self.save_books_to_json(books)
  books_data = books.map(&:to_hash)
  File.write('books.json', JSON.pretty_generate(books_data))
end
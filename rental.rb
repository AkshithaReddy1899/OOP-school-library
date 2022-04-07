class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    book.rentals.push(self)
    person.rentals.push(self)
  end
end

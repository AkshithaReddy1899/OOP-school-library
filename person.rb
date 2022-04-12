require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :age, :name, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rentals(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

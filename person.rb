require './nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: false)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
CapitalizedPerson = CapitalizeDecorator.new(person)
puts CapitalizedPerson.correct_name
CapitalizedTrimmedPerson = TrimmerDecorator.new(CapitalizedPerson)
puts CapitalizedTrimmedPerson.correct_name

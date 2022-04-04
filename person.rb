class Person
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: false)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

per = Person.new(2, 'Aksha')

puts per.can_use_services?

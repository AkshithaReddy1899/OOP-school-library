class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :age, :name
  attr_reader :id

  def can_use_services?
    return true if of_age? || Person.parent_permission

    false
  end

  private

  def of_age?
    return true if Person.age < 18

    false
  end
end

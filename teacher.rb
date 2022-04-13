require './person'

class Teacher < Person
  def initialize(age, name, specialization)
    super(id, age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

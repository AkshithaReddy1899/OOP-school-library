require './book'
require './classroom'
require './person'
require './rental'
#require './student'

book1 = Book.new('asdf', 'srdty')
classroom = Classroom.new('a')
per = Person.new(22, 'aksha')
rental1 = Rental.new('2022-09-01', book1, per)
#student1 = Student.new('A', 22, 'aksha')

puts classroom
#puts book1.add_rentals('2022-09-01', per)
puts classroom.add_students('aksha')
#puts rental1
#puts student1

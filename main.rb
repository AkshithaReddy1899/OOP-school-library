require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class Main
	def initialize
		@books = []
		@persons = []
		@rentals = []
	end

	def menu
    puts 'Welcome to School Library App!'
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    options(gets.chomp)
  end

	def list_all_books
		if @books.empty?
			puts ''
			puts 'Database is empty, Add a book!'
			puts ''
		else
			@books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
		end
		puts menu
	end

	def list_all_people
		if @persons.empty?
			puts ''
			puts 'Database is empty, Add a person!'
			puts ''
		else
			@persons.each {|p| puts "(#{p.class.name}) [ Name: #{p.name}, Age: #{p.age}, Id: #{p.id} ]"}
		end
		puts menu
	end

	def create_a_person
		puts 'Do you want to create (1) a student or (2) a teacher? [Inpt the number]:'
		per_option = gets.chomp
		case per_option
		when '1'
			create_student
		when '2'
			create_teacher
		else
			puts 'Enter number 1 or 2'
			puts ''
		end
		puts menu
	end

	def create_student
		puts 'Create a student'
		print 'Age: '
		age = gets.chomp.to_i
		print 'Name: '
		name = gets.chomp
		print 'Has parent permission? [y/n]: '
		parent_permission = gets.chomp.downcase
		@persons.push(Student.new(age, 'Unknown', name))
		puts 'New student added!'
		puts menu
	end

	def create_teacher
		puts 'Create teacher'
		print 'Age: '
		age = gets.chomp.to_i
		print 'Name: '
		name = gets.chomp
		print 'Specialization: '
		specialization = gets.chomp
		@persons.push(Teacher.new(age, specialization, name))
		puts 'New teacher added!'
		puts menu
	end

	def create_a_book
		puts 'Create a book'

		print 'Title: '
		title = gets.chomp

		print 'Author: '
		author = gets.chomp
		
		book = Book.new(title, author)
		@books. << book
		puts 'New book added'
		puts menu
	end

	def create_a_rental
		puts 'Create a new rental'
		if @books.empty? && @persons.empty?
			puts 'No person registered or books to rent'
		else
			puts 'Pick a book from the list below'
			i = 0
			while i < @books.length
				puts "#{i}) Title: #{@books[i].title}, Author: #{@books[i].author}"
				i += 1
			end
			book_id = gets.chomp.to_i
			j=0
			while j < @persons.length
				puts "#{j}) [(#{@persons[j].class.name}) Name: #{@persons[j].name}, Age: #{@persons[j].age} id: #{@persons[j].id}]"
				j += 1
			end
			person_id = gets.chomp.to_i
			print "Date [yyyy-mm-dd]: "
			date = gets.chomp
			@rentals.push(Rental.new(date, @books[book_id], @persons[person_id]))
			puts 'Rental created'
		end
	end

	def list_all_rentals_for_person_id
		print 'ID of person: '
		id = gets.chomp.to_i
		puts "Rented Books:"
		@rentals.each do |rent|
			if rent.person.id == id
				puts "Person: #{rent.person.name}, Date: #{rent.date}, Book: '#{rent.book.title}' by #{rent.book.author}"
			else
				puts 'No books rented by the given id'
			end
		end
	end

  def exit_option
    puts 'Thank you for using School Library App! '
  end

  def options(num)
    case num
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_all_rentals_for_person_id
    when '7'
      exit_option
		else
			puts 'Enter a number between 1 and 7'
    end
  end

end

Main.new.menu

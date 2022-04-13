require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_options
    puts 'Welcome to School Library App!'
    until menu
      user_input = input
      if user_input == '7'
        puts 'Thank you for using my school library!'
        break
      end
      options user_input
    end
  end

  def input
    gets.chomp
  end

  def list_all_books
    if @books.empty?
      puts ''
      puts 'Database is empty, Add a book!'
      puts ''
    else
      @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @persons.empty?
      puts ''
      puts 'Database is empty, Add a person!'
      puts ''
    else
      @persons.each { |p| puts "(#{p.class.name}) [ Name: #{p.name}, Age: #{p.age}, Id: #{p.id} ]" }
    end
  end

  def create_a_person
    puts 'Do you want to create (1) a student or (2) a teacher? [Inpt the number]:'
    per_option = input
    case per_option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Enter number 1 or 2'
      puts ''
    end
  end

  # rubocop:disable Metrics/MethodLength
  def create_student
    puts 'Create a student'
    print 'Age: '
    age = input.to_i
    print 'Name: '
    name = input
    print 'Classroom: '
    classroom = input
    print 'Has parent permission? [y/n]: '
    permission = input
    parent_permission = false
    if %w[y n].include?(permission)
      case permission
      when 'y' then parent_permission = true
      when 'n' then parent_permission = false
      end
      @persons.push(Student.new(age, classroom, name, parent_permission))
      puts 'New student added!'
    else
      puts 'Please pick a value "Y" or "N"'
      create_student
    end
  end
  # rubocop:enable Metrics/MethodLength

  def create_teacher
    puts 'Create teacher'
    print 'Age: '
    age = input.to_i
    print 'Name: '
    name = input
    print 'Specialization: '
    specialization = input
    @persons.push(Teacher.new(age, specialization, name))
    puts 'New teacher added!'
  end

  def create_a_book
    puts 'Create a book'

    print 'Title: '
    title = input

    print 'Author: '
    author = input

    book = Book.new(title, author)
    @books.<< book
    puts 'New book added'
  end

  def create_a_rental
    puts 'Create a new rental'
    if @books.empty? && @persons.empty?
      puts 'No person registered or books to rent'
    else
      create_rental
      puts 'Rental created'
    end
  end

  def create_rental
    puts 'Pick a book from the list below'
    i = 0
    while i < @books.length
      puts "#{i}) Title: #{@books[i].title}, Author: #{@books[i].author}"
      i += 1
    end
    book_id = input.to_i
    j = 0
    while j < @persons.length
      puts "#{j}) (#{@persons[j].class.name})[Name: #{@persons[j].name},Age: #{@persons[j].age}, id: #{@persons[j].id}]"
      j += 1
    end
    person_id = input.to_i
    print 'Date [yyyy-mm-dd]: '
    date = input
    @rentals.push(Rental.new(date, @books[book_id], @persons[person_id]))
  end

  def list_all_rentals_for_person_id
    print 'ID of person: '
    id = input.to_i
    puts 'Rented Books:'
    @rentals.each do |rent|
      if rent.person.id == id
        puts "Person: #{rent.person.name}, Date: #{rent.date}, Book: '#{rent.book.title}' by #{rent.book.author}"
      else
        puts 'No books rented by the given id'
      end
    end
  end
end

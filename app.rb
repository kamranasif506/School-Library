require_relative 'book'
require_relative 'student'
require_relative 'teacher'
class App
    attr_accessor :books, :persons, :rentals
    def initialize
        @books = []
        @persons = []
        @rentals = []
    end

    def list_all_books
        puts "List of Books. \n"
        @books.each{ |book| puts "title: #{book.title} by author : #{book.author}" }
    end
    def list_all_people
        @persons.each do |person|
            if person.instance_of?(Teacher)
                puts "[Teacher]Age: #{person.age} Name: #{person.name}, ID: #{person.id}"
            else
                puts "[Student]Age: #{person.age},Name: #{person.name}, ID: #{person.id} "
            end
        end
    end

    def create_a_person
        print 'Do you want to add a student (1) or a teacher (2)? [Insert the number]: '
        is_student = gets.chomp.strip.to_i
        print 'age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        case is_student
        when 1
            puts 'Has Parent Permission [Y/N]'
            permission = gets.chomp.downcase == 'y'
            create_student(age, person_name, permission)
        when 2
            create_teacher(age, name)
        end
        puts "Person added Successfully"
        $stdout.flush
    end
    def create_student(age,name,permission)
        @persons << Student.new(age,permission,name)
    end
    def create_teacher(age,name)
        puts 'Specialization: '
        specialization = gets.chomp
        @persons << Teacher.new(age,specialization,name)
    end

    def add_new_book
        print "Book: "
        book_name = gets.chomp
        print "Author: "
        author_name = gets.chomp
        @books << Books.new(book_name,author_name)
        puts "Book added successfully"
        $stdout.flush
    end

    def add_rental
        puts 'Select a book from the following list by number'
        @books.each_with_index do |book, index|
            puts "#{index}) Title: #{book.title}, Author: #{book.author}"
        end
        book_index = gets.chomp.to_i
        select_book = @books[book_index]
        print 'Select a person from the following list by number (not ID)'
        @persons.each_with_index do |person, index|
          puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
        end
        person_index = gets.chomp.to_i
        select_person = @persons[person_index]
        print 'Enter Rental Date (yyyy-mm-dd)'
        date = gets.chomp
        @rentals.push(Rental.new(date, select_person, select_book))
        puts 'rental added successfully'
        $stdout.flush
    end
    def list_all_rentals
        print 'ID of person'
        input_person_id = gets.chomp.to_i
        puts 'Rentals'
        @rentals.each do |rental|
            puts "Date: #{rental.date}, Book: #{rental.book.title}" if rental.person.id == input_person_id
        end
    end

    def render_choices
        puts 'Please Choose an Option by entering a number:'
        puts '1. List all books.'
        puts '2. List all people.'
        puts '3. Create a person.'
        puts '4. Create a book.'
        puts '5. Create a rental.'
        puts '6. List all rentals for a given person id.'
        puts '7. EXIT'
    end
    
    def choose_number(choice)
        case choice
        when 1
          list__all_books
        when 2
          list_all_persons
        when 3
          create_a_person
        when 4
          create_a_book
        when 5
          create_a_rental
        when 6
          list_of_rentals
        end
    end
    
    def show
        loop do
          render_choices
          choice = gets.chomp.to_i
          if choice >= 7
            puts 'Thank you for using this app'
            break
          end
          choose_number(choice)
        end
    end
end
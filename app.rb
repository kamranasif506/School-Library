require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require 'json'

class App
  attr_accessor :books, :persons, :rentals

  def initialize(books_data,person_data,rental_data)
    @books = books_data
    @persons = person_data
    @rentals = rental_data
  end

  def list_all_books
    puts "\nList of Books. \n"
    @books.each(&:print)
    puts "\n"
  end

  def list_all_people
    puts "\n"
    @persons.each(&:print)

    puts "\n"
  end

  def list_all_rentals
    print "\nID of person"
    input_person_id = gets.chomp.to_i

    person = @persons.find { |p| p.id == input_person_id }
    rentals = @rentals.select { |r| r.person == person }

    puts 'Rentals'
    rentals.each(&:print)
    puts "\n"
  end

  def create_a_person
    print "\nDo you want to add a student (1) or a teacher (2)? [Insert the number]: "
    is_student = gets.chomp.strip.to_i
    print 'age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case is_student
    when 1
      print 'Has Parent Permission [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      create_student(age, name, permission)
    when 2
      create_teacher(age, name)
    end
    print "Person added Successfully. \n"
    $stdout.flush
  end

  def create_student(age, name, permission)
    @persons << Student.new(age, parent_permission: permission, name: name)
  end

  def create_teacher(age, name)
    puts 'Specialization: '
    specialization = gets.chomp
    @persons << Teacher.new(age, specialization, name: name)
  end

  def add_new_book
    print "\nBook: "
    book_name = gets.chomp
    print 'Author: '
    author_name = gets.chomp
    @books << Book.new(book_name, author_name)
    puts "Book added successfully.\n"
    $stdout.flush
  end

  def add_rental
    puts "\nSelect a book from the following list by number"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    select_book = @books[book_index]
    print "Select a person from the following list by number (not ID)\n"
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    select_person = @persons[person_index]
    print 'Enter Rental Date (yyyy-mm-dd)'
    date = gets.chomp
    @rentals.push(Rental.new(date, select_person, select_book))
    puts "rental added successfully.\n"
    $stdout.flush
  end
  def store_books
    data = @books.map do |book|
      { title: book.title, author: book.author, rentals: book.rentals }
    end
    file = File.open('data/books.json', 'w')
    file.puts(data.to_json)
    file.close

  end
  def store_persons
    person_data = @persons.to_json
    file = File.open('data/persons.json', 'w')
    file.puts(person_data)
    file.close

  end
  def store_rental
    rental_data = @rentals.to_json
    file = File.open('data/rentals.json', 'w')
    file.puts(rental_data)
    file.close

  end

  def store_data
    store_books
    store_persons
    store_rental
  end

end

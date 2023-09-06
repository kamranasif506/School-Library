require_relative 'app'

require 'json'

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

def choose_number(choice, app)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_a_person
  when 4
    app.add_new_book
  when 5
    app.add_rental
  when 6
    app.list_all_rentals
  end
end

def main
  # load the data and then parse it to the app
  books = load_book_data
  persons = load_person_data
  rentals = load_rental_data
  app = App.new(books, persons, rentals)
  loop do
    render_choices
    choice = gets.chomp.to_i
    if choice >= 7
      # we will save the data
      app.store_data
      puts 'Thank you for using this app'
      break
    end
    choose_number(choice, app)
  end
end

def load_book_data
  all_book = []
  if File.exist?('data/books.json')
    book_data = JSON.parse(File.read('data/books.json'))
    book_data.each { |b| all_book.push(Book.new(b['title'], b['author'])) }
  end
  all_book
end

def load_person_data
  input_data = JSON.parse(File.read('data/persons.json'))
  input_data.map do |person|
    if person['type'] == 'Student'
      Student.new(person['age'], parent_permission: person['parent_permission'], name: person['name'])
    else
      Teacher.new(person['age'], person['specialization'], name: person['name'])
    end
  end
end

def load_rental_data
  JSON.parse(File.read('data/rentals.json'))
end

main

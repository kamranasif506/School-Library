require_relative 'book'
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
    def add_new_book
        print "Book: "
        book_name = gets.chomp
        print "Author: "
        author_name = gets.chomp
        @books << Books.new(book_name,author_name)
        puts "Book added successfully"
        $stdout.flush
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
require_relative '../book'

RSpec.describe Book do
    it "book" do
        book = Book.new('Avengers', 'Tony Stark')
        expect(book.title).to eql('Avengers')  
        expect(book.author).to eql('Tony Stark')  
    end
end
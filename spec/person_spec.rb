require_relative '../person'

describe Person do
    it "person" do
        person = Person.new(12, parent_permission: true, name: 'Unknown')
        expect(person.age).to eql(12)  
    end
end
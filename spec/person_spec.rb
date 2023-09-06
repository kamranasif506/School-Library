require_relative '../person'

RSpec.describe Person do
    before :each do
        @person = Person.new(12, parent_permission: true, name: 'Ichsan')
    end
    
    describe "#age" do
        it "should be 12" do
            expect(@person.age).to eql(12)  
        end
    end

    describe "#parent_permission" do
        it "should be true" do
            expect(@person.parent_permission).to eql(true)  
        end
    end

    describe "#name" do
        it "should be ichsan" do
            expect(@person.name).to eql("Ichsan")  
        end
    end
end
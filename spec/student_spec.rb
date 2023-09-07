require_relative '../student'

RSpec.describe Student do
    before :each do
        @student = Student.new(27, parent_permission: true, name: 'Kamran')
    end
    
    describe "#new" do
        it "should be instance of Student" do
            expect(@student).to be_instance_of(Student)  
        end
    end

    describe "#age" do
        it "should be 27" do
            expect(@student.age).to eql(27)  
        end
    end

    describe "#parent_permission" do
        it "should be true" do
            expect(@student.parent_permission).to eql(true)  
        end
    end

    describe "#name" do
        it "should be Kamran" do
            expect(@student.name).to eql("Kamran")  
        end
    end
end
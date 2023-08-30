require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def classroom=(new_classroom)
    return if @classroom == new_classroom

    if @classroom
      @classroom.remove_student(self)
    end

    @classroom = new_classroom
    new_classroom&.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

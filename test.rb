module Display
  def display_info()
    puts "#{self.class} name is #{self.name}"
  end
end


class School
    include Display

    attr_accessor :name, :students

    def initialize(name)
        self.name = name
        self.students = []
    end

    def new_student(name, roll_number, marks)
        begin
            stud = Student.new(name, roll_number, marks)
            self.students.push(stud)
            
        rescue RuntimeError => e
            puts e.message
        end
        
    end

end

class Student
    include Display

    attr_accessor :name, :roll_number, :marks

    def initialize(name, roll_number, marks)
        
        begin  
            if !(name.is_a?(String))
                raise "Name must be string"
            end
    
            if !(roll_number.is_a?(Integer))
                raise "Roll number must be an integer"
            end
    
            if !(marks.is_a?(Hash))
                raise "Marks must be a hash of the format {subject_name(String) => subject_marks(Integer)}"
            else
                marks.each do |subject, subject_marks|
                    if !(subject.is_a?(String) && subject_marks.is_a?(Integer))
                        raise "Marks must be a hash of the format {subject_name(String) => subject_marks(Integer)}"
                    end
                end
            end
            self.name = name
            self.roll_number = roll_number
            self.marks = marks
        end

    end

    def display_info
        super
        puts "Roll number: #{self.roll_number}"
        puts "Marks"
        self.marks.each do |subject, subject_marks|
            puts "#{subject}: #{subject_marks}"
        end
    end

    def show_average
        sum = 0
        self.marks.each do |subject, subject_marks|
            sum = sum + subject_marks
        end
        puts "#{self.name}'s average of marks: #{sum.to_f/@marks.length}"
    end

end

school1 = School.new("ABC")
school1.new_student("john doe", 100, {"Math" => 90, "Science" => 85, "English" => 92})

school1.display_info
school1.students[0].display_info

# school1.students.each { | student | student.display_info }
# school1.students.each { | student | student.show_average }

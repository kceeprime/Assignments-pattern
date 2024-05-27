class Student

    def initialize(name, roll_number, marks)
        @name = name
        @roll_number = roll_number
        @marks = marks
    end

    def display_info
        puts "Name: #{@name}"
        puts "Roll number: #{@roll_number}"
        puts "Marks"
        @marks.each do |subject, subject_marks|
            puts "#{subject}: #{subject_marks}"
        end
    end

    def show_average
        sum = 0
        @marks.values.each do |subject_marks|
            sum = sum + subject_marks
        end
        puts "Average of marks: #{sum.to_f/@marks.length}"
    end

end


stud = Student.new("john doe", 10, {"Math" => 90, "Science" => 85, "English" => 92})
stud.display_info
stud.show_average

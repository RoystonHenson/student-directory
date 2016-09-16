def chomps
  get_name = "Please enter a name:"
  get_cohort = "Please enter a cohort:"
  puts get_name
  $name = $stdin.gets.delete("\n")
  puts get_cohort
  $cohort = $stdin.gets.delete("\n")
end
def input_students
    puts "Please enter the names and cohorts of the students when prompted"
    puts "To finish, just hit return three times"
    # create an empty array
    students = []
    # get the first name
    chomps
    # while the name is not empty, repeat this code
    while !$name.empty? do
      # add the student hash to the array
      students << {name: $name, cohort: $cohort,
                   hobbies: :hobbies, country_of_bith: :country,
                   height: :height, weight: :weight}
      if students.length > 1
       puts "Now we have #{students.count} students".center(40)
      else
       puts "Now we have #{students.count} student".center(40)
      end
      # get another name from the user

      chomps
    end
    # return the array of students
    students
end

def print_header
  puts "The Students of Villains Academy".center(40)
  puts "--------------------".center(40)
end

def print(students)
  count = 0
  while count < students.length
    if students[count - 1][:name][0] == "R" && students[count - 1][:name].length < 12
      puts "#{count + 1}: #{students[count - 1][:name]} (#{students[count - 1][:cohort]} cohort)"
    else
      "#{count + 1}: #{students[count - 1][:name]} (#{students[count - 1][:cohort]} cohort)"
    end
    break if count == students.length
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

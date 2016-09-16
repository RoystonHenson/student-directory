def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = $stdin.gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: :November,
                   hobbies: :hobbies, country_of_bith: :country,
                   height: :height, weight: :weight}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = $stdin.gets.chomp
    end
    # return the array of students
    students
end

def print_header
  puts "The Students of Villains Academy"
  puts "--------------------"
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
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  
  # create an empty array
  students = []
 
  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do

    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.size} students"

    # get another name from the user
    name = $stdin.gets.chomp
  end
  # return the array of students
  students
end

# and then print them
def print_header
  puts "\nThe Students of Villains Academy"
  puts '-' * 32
end


def print(students, letter=false)
  if letter
    students.select { |student| student[:name][0].upcase == letter.upcase }.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  else
    students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  end
end

 # finally we print the total number of students
def print_footer(students)
  puts "\nOverall, we have #{students.size} great students!"
end

students = input_students
print_header
print(students)
print_footer(students)
print(students, 'r')
puts '-' * 3
print(students, 's')
puts '-' * 3
print(students, 'z')
puts '-' * 3
print(students, 'B')
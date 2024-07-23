# first we put the students into an array
students = [
    {name: 'Dr. Hannibal Lecter', cohort: :november},
    {name: 'Darth Vader', cohort: :november},
    {name: 'Nurse Ratched', cohort: :november},
    {name: 'Michael Corleone', cohort: :november},
    {name: 'Alex DeLarge', cohort: :november},
    {name: 'The Wicked Witch of the West', cohort: :november},
    {name: 'Terminator', cohort: :november},
    {name: 'Freddy Krueger', cohort: :november},
    {name: 'The Joker', cohort: :november},
    {name: 'Joffrey Baratheon', cohort: :november},
    {name: 'Norman Bates', cohort: :novembe}
]

# and then print them
def print_header
  puts "\nThe Students of Villains Academy"
  puts '-' * 32
end


def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

 # finally we print the total number of students
 def print_footer(students)
  puts "\nOverall, we have #{students.size} great students!"
 end

 print_header
 print(students)
 print_footer(students)
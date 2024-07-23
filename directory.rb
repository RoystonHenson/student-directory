# first we put the students into an array
students = [
    'Dr. Hannibal Lecter',
    'Darth Vader',
    'Nurse Ratched',
    'Michael Corleone',
    'Alex DeLarge',
    'The Wicked Witch of the West',
    'Terminator',
    'Freddy Krueger',
    'The Joker',
    'Joffrey Baratheon',
    'Norman Bates'
]

# and then print them
def print_header
  puts "\nThe Students of Villains Academy"
  puts '-' * 32
end


def print(names)
  names.each { |s| puts s }
end

 # finally we print the total number of students
 def print_footer(names)
  puts "\nOverall, we have #{names.size} great students!"
 end

 print_header
 print(students)
 print_footer(students)
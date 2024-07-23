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
puts "\nThe Students of Villains Academy"
puts '-' * 32
students.each { |s| puts s }

 # finally we print the total number of students
puts "\nOverall, we have #{students.size} great students!"

# lets put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Norman Bates",
]
# and then print them
puts "The Students of Villains Academy"
puts "--------------------"
students.each {|student| puts student}
# finally, we print the total
puts "Overall, we have #{students.count} great students"

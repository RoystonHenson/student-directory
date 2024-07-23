# first we print the list of students
puts <<-EOF

    The Students of Villains Academy
    #{'-' * 32}

    Dr. Hannibal Lecter
    Darth Vader
    Nurse Ratched
    Michael Corleone
    Alex DeLarge
    The Wicked Witch of the West
    Terminator
    Freddy Krueger
    The Joker
    Joffrey Baratheon
    Norman Bates

    EOF

student_count = 11

 # finally we print the total number of students
print 'Overall, we have '
 # it's important that print() doesn't add new line characters
print student_count
puts ' great students'

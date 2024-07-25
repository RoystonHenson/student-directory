def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  
  # create an empty array
  @students = []
 
  # get the first name
  name = $stdin.gets.chomp

  # make sure names are capitalised
  name = capitalise_words(name)

  # while the name is not empty, repeat this code
  while !name.empty? do

    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.size} students"

    # get another name from the user
    name = $stdin.gets.chomp

    # make sure names are capitalised
    name = capitalise_words(name)
  end
  # return the array of students
  @students
end

def add_detail
  puts 'Enter the name of the student you would like to add information for'
  name = $stdin.gets.chomp
  if @students.find { |student| student[:name].upcase == name.upcase} == nil
    puts 'That student is not in our directory'
  else
    puts 'What information you would like to add? (e.g. age, height, etc.)'
    key = $stdin.gets.chomp
    puts 'And now enter the information'
    value = $stdin.gets.chomp
    puts "You have added '#{key.capitalize}: #{value}' for #{name.capitalize}"
    index = @students.index(@students.find { |student| student[:name].upcase == name.upcase})
    @students[index][key.downcase.to_sym] = value
  end
end

# and then print them
def print_header
  puts "\nThe Students of Villains Academy"
  puts '-' * 32
end

def print(students, letter=false)
  if letter
    display_students(students.select { |student| student[:name][0].upcase == letter.upcase })
  else
    display_students(students)
  end
end

def display_students(students)
  count = 1
  while count <= students.size
    puts "#{count}. #{students[count - 1][:name]} (#{students[count - 1][:cohort]} cohort)" if students[count - 1][:name].size < 12
    count += 1
  end
end

 # finally we print the total number of students
def print_footer(students)
  puts "\nOverall, we have #{students.size} great students!"
  puts 'Note: Names over 12 characters long are currently not being shown'
end

def capitalise_words(words)
  words.split.map(&:capitalize).join(' ')
end

students = input_students
print_header
print(students)
print_footer(students)


def input_students
  # create an empty array
  @students = []
  # get student name and cohort from user
    name, cohort = 'ready', 'set'
    while !name.empty? || !cohort.empty?
      puts "Please enter the name of the student you want to add (Hit enter to cancel)"
      name = $stdin.gets.chomp
      break if name == ''
      puts "What cohort is this student in? (Hit enter to cancel)"
      cohort = $stdin.gets.chomp
      break if cohort == ''
      if !name.empty? && !cohort.empty?
        # make sure student names are capitalised
        name = capitalise_words(name) 
        # add student hash to the array
        @students << {name: name, cohort: cohort.to_sym}
        puts "Now we have #{@students.size} students"
      end
    end
  # return array of students
  @students
end

def add_detail
  puts 'Enter the name of the student you would like to add information for'
  name = $stdin.gets.chomp
  # check if student is in the directory
  if @students.find { |student| student[:name].upcase == name.upcase} == nil
    puts 'That student is not in our directory'
  else
    # prompt user for information to add
    puts 'What information you would like to add? (e.g. age, height, etc.)'
    key = $stdin.gets.chomp
    puts 'And now enter the information'
    value = $stdin.gets.chomp
    puts "You have added '#{key.capitalize}: #{value}' for #{name.capitalize}"
    # find hash containing student and add the information supplied by user
    index = @students.index(@students.find { |student| student[:name].upcase == name.upcase})
    @students[index][key.downcase.to_sym] = value
  end
end

# and then print them
def print_header
  puts "The Students of Villains Academy".center(80)
  puts ('-' * 32).center(80)
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
    puts ("#{count}. #{students[count - 1][:name]} (#{students[count - 1][:cohort]} cohort)" if students[count - 1][:name].size < 12).center(80)
    count += 1
  end
end

 # finally we print the total number of students
def print_footer(students)
  puts "\nOverall, we have #{students.size} great students!"\
       'Note: Names over 12 characters long are currently not being shown'.center(80)
end

def capitalise_words(words)
  words.split.map(&:capitalize).join(' ')
end

students = input_students
print_header
print(students)
print_footer(students)


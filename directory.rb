def menu
  while true
    puts "\nWelcome to the Student Directory. Please enter one of the folowing commands:"
    puts """   
           New   -  Add new students
           Add   -  Add details for existing students
           Show  -  Display list of existing students
           Exit  -  Exit Student Directory
         """
    choice = $stdin.gets.chomp.downcase
    if choice == 'new'
      input_students
    elsif choice == 'add'
      add_detail
    elsif choice == 'show'
      puts 'How would you like to display the students?:'
      puts """
           All     -  Lists all students
           Month   -  You want to search students by month
           Letter  -  You want to search students by first letter of their name
      """
      choice = $stdin.gets.chomp.downcase
      if choice == 'all'
        print(@students)
      elsif choice == 'month'
        puts 'Enter the month of the cohort:'
        choice = $stdin.gets.chomp.downcase.to_sym
          if @students.any? { |student| student[:cohort] == choice }
            print(@students.select { |student| student[:cohort] === choice })
          else
            puts 'Sorry, there are no students for that month.'
          end
      elsif choice == 'letter'
        puts 'Please enter the first letter of the student\'s name'
        choice = $stdin.gets.chomp.upcase
        if @students.any? { |student| student[:name][0] == choice }
          print(@students, choice)
        else
          puts 'Sorry, there are no students matching that search request.'
        end
      end
    elsif choice == 'exit'
      exit(0)
    end
  end
end

def input_students
  # create an empty array
  @students = []
  # get student name and cohort from user
    name, cohort = 'ready', 'set'
    while !name.empty? || !cohort.empty?
      puts "Please enter the name of the student you want to add (Hit enter to cancel):"
      name = $stdin.gets.chomp
      break if name == ''
      puts "What cohort is this student in? (Hit enter to cancel):"
      cohort = $stdin.gets.chomp.capitalize
      break if cohort == ''
      if !name.empty? && !cohort.empty?
        # make sure student names are capitalised
        name = capitalise_words(name) 
        # add student hash to the array
        @students << {name: name, cohort: cohort.to_sym}
          puts "Now we have #{@students.size} #{singular_or_plural('student', @students.size)}."
          puts @students.size == 1 ? "Now we have #{@students.size} student." : "Now we have #{@students.size} students."
      end
    end
  # sort the students by cohort
  @students = @students.sort_by { |student| student[:cohort] } 
  # return array of students
  print_header
  print(@students)
  print_footer(@students)
end

def add_detail
  puts 'Enter the name of the student you would like to add information for:'
  name = $stdin.gets.chomp
  # check if student is in the directory
  if @students.find { |student| student[:name].upcase == name.upcase} == nil
    puts 'That student is not in our directory'
  else
    # prompt user for information to add
    puts 'What information you would like to add? (e.g. age, height, etc.):'
    key = $stdin.gets.chomp
    puts 'And now enter the information'
    value = $stdin.gets.chomp
    puts "You have added '#{key.capitalize}: #{value}' for #{name.capitalize}."
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
  line_width = 30
  while count <= students.size
    if students[count - 1][:name].size < 12
      puts "#{count}. #{students[count - 1][:name]}".rjust(line_width) + "(#{students[count - 1][:cohort]} cohort)".rjust(line_width)
    end
      count += 1
    end
end

 # finally we print the total number of students
def print_footer(students)
  puts "\nOverall, we have #{@students.size} great #{singular_or_plural('student', @students.size)}! "\
       'Note: Names over 12 characters long are currently not being shown.'.center(80)
end

def capitalise_words(words)
  words.split.map(&:capitalize).join(' ')
end

def singular_or_plural(string, number)
  number == 1 ? string : string << 's'
end

menu()


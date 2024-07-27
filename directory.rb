def menu
  loop do
    menu_introduction
    choice = $stdin.gets.chomp.downcase
    case choice
    when 'new'  then input_students
    when 'add'  then add_student_detail
    when 'show' then puts @students.nil? ? 'There are no students in the directory!' : show_students
    when 'load' then try_load_students
    when 'save' then save_students
    when 'exit' then exit(0)    
    else puts 'Please enter one of the commands to continue:'
    end
  end
end

def input_students
  @students = []
  name, cohort = 'ready', 'set'
  while !name.empty? || !cohort.empty?
    puts "Please enter the name of the student you want to add (Hit enter to cancel):"
    name = $stdin.gets.chomp
    name = capitalise_words(name) 
    break if name == ''
    puts "What cohort is this student in? (Hit enter to cancel):"
    cohort = $stdin.gets.chomp
    break if cohort == ''
    @students << {name: name, cohort: cohort.to_sym} if !name.empty? && !cohort.empty?
    puts "Now we have #{@students.size} #{singular_or_plural('student', @students.size)}."
  end
  @students = @students.sort_by { |student| student[:cohort] } 
  display_students_list(@students)
end

private

def menu_introduction
  puts "\nWelcome to the Student Directory. Please enter one of the following commands:"
  puts """   
             New   -  Add new students
             Add   -  Add details for existing students
             Show  -  Display list of existing students
             Save  -  Save Student Directory to a file
             Load  -  Load existing students from a file 
             Exit  -  Exit Student Directory
       """
end

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

def print_footer(students)
  puts "\nOverall, we have #{@students.size} great #{singular_or_plural('student', @students.size)}! "\
       'Note: Names over 12 characters long are currently not being shown.'.center(80)
end

def display_students(students)
  count = 1
  line_width = 30
  while count <= students.size
    if students[count - 1][:name].size < 12
      puts "#{count}. #{students[count - 1][:name]}".rjust(line_width) + "(#{students[count - 1][:cohort].capitalize} cohort)".rjust(line_width)
    end
      count += 1
    end
end

def display_students_list(students)
  print_header
  print(students)
  print_footer(students)
end

def add_student_detail
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

def submenu_show
  puts 'How would you like to display the students?:'
  puts """
             All     -  Lists all students
             Month   -  You want to search students by month
             Letter  -  You want to search students by first 
                        letter of their name
       """
end

def show_students
  submenu_show
  choice = $stdin.gets.chomp.downcase
  if choice == 'all'
    print(@students)
  elsif choice == 'month'
    show_students_by_month
  elsif choice == 'letter'
    puts 'Please enter the first letter of the student\'s name'
    choice = $stdin.gets.chomp.upcase
    if @students.any? { |student| student[:name][0] == choice }
      print(@students, choice)
    else
      puts 'Sorry, there are no students matching that search request.'
    end
  end
end

def show_students_by_month
  puts 'Enter the month of the cohort:'
  choice = $stdin.gets.chomp.downcase.to_sym
  if @students.any? { |student| student[:cohort] == choice }
    print(@students.select { |student| student[:cohort] === choice })
  else
    puts 'Sorry, there are no students for that month.'
  end
end

def capitalise_words(words)
  words.split.map(&:capitalize).join(' ')
end

def singular_or_plural(string, number)
  number == 1 ? string : string << 's'
end

def load_students(filename='students.csv')
  @students = [] if @students.nil?
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts 'File loaded...'
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.size} from #{filename}"
  else
   puts "Sorry, #{filename} doesn't exist"
   exit(0)
  end
end

def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
  puts 'File saved...'
end
menu()
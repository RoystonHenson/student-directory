@students = []

def chomps
  get_name = "Please enter a name:"
  get_cohort = "Please enter a cohort:"
  puts get_name
  $name = $stdin.gets.delete("\n")
  puts get_cohort
  $cohort = $stdin.gets.delete("\n")
end

def input_students
    puts "Please enter the names and cohorts of the students when prompted"
    puts "To finish, just hit return three times"
    chomps
    while !$name.empty? do
      @students << {name: $name, cohort: $cohort,
                   hobbies: :hobbies, country_of_bith: :country,
                   height: :height, weight: :weight}
      if @students.length > 1
       puts "Now we have #{@students.count} students".center(40)
      else
       puts "Now we have #{@students.count} student".center(40)
      end
      chomps
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The Students of Villains Academy".center(40)
  puts "--------------------".center(40)
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(40)
end

interactive_menu

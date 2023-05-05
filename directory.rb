require 'date'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end 

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then print_students_list
  when "3" then save_students
  when "4" then load_students
  when "9" then exit
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp 
  while !name.empty? do
    puts "Enter #{name}'s cohort (e.g. November):"
    cohort = STDIN.gets.chomp
    while !Date::MONTHNAMES.include?(cohort.capitalize) do # check if cohort is a valid month
      puts "Please enter a valid month:"
      cohort = STDIN.gets.chomp
    end
    puts "Enter #{name}'s hobby:"
    hobby = gets.chomp
    puts "Enter #{name}'s country of birth:"
    birth_country = gets.chomp
    puts "Enter #{name}'s height (in cm):"
    height = gets.chomp
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, birth_country: birth_country, height: height }
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{student.count} students"
    end
    save_students
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------".center(50)
end 

def print_students_list()
  if @students.empty?
    puts "There are no students to display"
    return
  end
  
  cohorts = @students.map {|student| student[:cohort]}.uniq
  cohorts.each do |cohort|
    puts "#{cohort} cohort:".center(50)
    @students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students ".center(50)
end 

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
  end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if file.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end
  
try_load_students
interactive_menu




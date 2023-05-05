@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end 

def print_students_list()
  print_header
  print(@students)
  print_footer(@students)
end 

def process(selection)
  case selection
  when "1" then input_students
  when "2" then print_students_list
  when "3" then save_students
  when "9" then exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  name = gets.chomp 
  while !name.empty? do
    puts "Enter #{name}'s hobby:"
    hobby = gets.chomp
    puts "Enter #{name}'s country of birth:"
    birth_country = gets.chomp
    puts "Enter #{name}'s height (in cm):"
    height = gets.chomp
    @students << {name: name, cohort: :november, hobby: hobby, birth_country: birth_country, height: height }
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
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

def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------".center(50)
end 

def print(students)
  index = 0  
  while index < students.length
    student = students[index]
    puts "#{index + 1}. #{student[:name]}, #{student[:cohort]} (cohort), #{student[:hobby]} (hobby), #{student[:birth_country]}, #{student[:height]}cm"
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students ".center(50)
end 

interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
print_short_names(students)



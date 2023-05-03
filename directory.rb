def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp 
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------"
end 

def print(students)  
  students.each_with_index do |students, index|
    puts "#{index + 1}. #{students[:name]} (#{students[:cohort]} cohort)"
  end
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students "
#its important that print() doesnt add new line characters
end 


students = input_students
print_header
print(students)
print_footer(students)



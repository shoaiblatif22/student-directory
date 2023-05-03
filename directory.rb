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

def print_filtered(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0].downcase == letter.downcase
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


students = input_students
print_header
print(students)
print_footer(students)

puts "Please enter a letter to filter by:"
letter = gets.chomp
print_filtered(students, letter)



def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp 
  while !name.empty? do
    puts "Enter #{name}'s hobby:"
    hobby = gets.chomp
    puts "Enter #{name}'s country of birth:"
    birth_country = gets.chomp
    puts "Enter #{name}'s height (in cm):"
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, birth_country: birth_country, height: height }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
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
#its important that print() doesnt add new line characters
end 

=begin
def print_filtered(students, letter)
  students.each_with_index do |student, index|
    if student[:name][0].downcase == letter.downcase
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end



def print_short_names(students)
  puts "Here is a list of students who have less than 12 characters in their name.".center(50)
  index = 0
  while index < students.length
    student = students[index]
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    index += 1
  end
end





students = input_students
print_header
print(students)
print_footer(students)
print_short_names(students)

=begin
puts "Please enter a letter to filter by:"
letter = gets.chomp
print_filtered(students, letter)
=end


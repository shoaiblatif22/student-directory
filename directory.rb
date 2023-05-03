
#first we print the list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Rached",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
def print_header
  puts "The students of Villains Academy"
  puts "---------"
end 

def print(names)  
  names.each do |names|
  puts names
end

def print_footer(names)
  print "Overall, we have #{student.count} great students "
#its important that print() doesnt add new line characters
end 

print_header
print(students)
print_footer(students)



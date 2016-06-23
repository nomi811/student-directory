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
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students(@filename)
  when "9"
    exit
    puts "I don't know what you meant, try again"
  end
end

def create_students_array
  @students << {name: @name, cohort: @cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  @name = STDIN.gets.chomp

  while !@name.empty? do
    @name, @cohort = @name.split(',')
    create_students_array
    puts "Now we have #{@students.count} students"

    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts
  puts
end

def save_students
  puts "What file would you like to save?"
  @filename = STDIN.gets.chomp
  file = File.open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "#{@students.length} students' data saved in #{@filename}"
  puts
  puts
  file.close
end

def read_file
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    create_students_array
  end
end

def load_students(filename = @filename)
  if @filename.nil?
    puts "What file would you like to load?"
    @filename = STDIN.gets.chomp
    read_file

  else
    read_file
  end
  puts "#{@students.length} students' data loaded into #{@filename}"
  puts
  puts
end

def try_load_students
  @filename = ARGV.first
  if @filename.nil?
    load_students(@filename = "students.csv")

  elsif File.exists?(@filename)
    load_students(@filename)
    puts "Loaded #{@students.count} from #{@filename}"
    puts
    puts
  else
    puts "Sorry, #{@filename} doesn't exist."
    puts
    puts
    exit
  end

end

try_load_students
interactive_menu


=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

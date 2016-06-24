require 'csv'
@students = []

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def interactive_menu
  loop do
    try_load_students
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
    puts "I don't know what you meant, try again"
  end
end

def create_students_array
  @students << { name: @name, cohort: @cohort }
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  @name = STDIN.gets.chomp

  until @name.empty?
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
  puts 'The students of Villains Academy'
  puts '-------------'
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
  puts 'What file would you like to save?'
  savefile = gets.chomp
  savefile = 'students.csv' if savefile == ''
  CSV.open(savefile, 'a+') do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.length} students' data saved in #{savefile}"
  puts
  puts
end
=begin
def read_file
  #file = CSV.read('students.csv')
  #file = File.open(@filename, "r")
  #file.each do |line|

  #@name, @cohort = line.chomp.split(',')     #chomp.split(',')
      #create_students_array
  #end
  puts file
end
=end
def load_students(*)
  puts 'What file would you like to load?'
  loadfile = gets.chomp
  #loadfile = 'students.csv' if loadfile == ''
  CSV.foreach(loadfile) do |row|
    @name, @cohort = row
    # create_students_array
    puts row.inspect
    @students << { name: @name, cohort: @cohort }
  end
  puts "#{@students.length} students' data loaded into #{loadfile}"
  puts
  puts
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?

  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
    puts
    puts
  else
    puts "Sorry, #{filename} doesn't exist."
    puts
    puts
    exit
  end
end

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

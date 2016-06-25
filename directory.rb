require 'csv'
@students = []

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the student list'
  puts '4. Load the student list'
  puts '9. Exit'
end

def interactive_menu
  loop do
    #try_load_students
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
    show_executed_names
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def create_students_array
  @students << { name: @name, cohort: @cohort }
end

def check_plurals
  @students.length == 1 ? @pluralize = 'student' : @pluralize = 'students'
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  @name = STDIN.gets.chomp

  until @name.empty?
    @name, @cohort = @name.split(',')
    create_students_array
    check_plurals
    puts "Now we have #{@students.count} #{@pluralize}"
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
  puts '-------------------------------------'
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  check_plurals
  puts "Overall, we have #{@students.count} great #{@pluralize}"
end

def save_students
  puts 'What file would you like to save your input into?'
  savefile = gets.chomp
  puts "savefile #{savefile}"
  savefile = 'students.csv' if savefile == ''
  puts savefile
  CSV.open(savefile, 'a+') do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts savefile
  puts "#{@students.length} students' data saved in #{savefile}"
end

def load_students(loadname = 'students.csv')
  if loadname.nil?
    puts 'What file would you like to load?'
    puts "loadname load_students 1 #{loadname}"
    loadname = gets.chomp
    puts "loadname #{loadname}"
  else
    loadname = 'students.csv'
    puts "loadname not nil #{loadname}"
    CSV.foreach(loadname) do |row|
      @name, @cohort = row
      create_students_array
    end
  end
  puts "#{@students.length} students' data loaded into #{loadname}"
end

def try_load_students
  filename = ARGV.first
  puts "filename: #{filename}"
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{@filename} doesn't exist."
    puts
    puts
    exit
  end
end

def show_executed_names
  computer_path = File.expand_path(File.dirname(File.dirname(__FILE__)))
  executed_file = File.basename(__FILE__)
  puts "The computer path is #{computer_path} and the executed_file is #{executed_file}"
end



try_load_students
interactive_menu

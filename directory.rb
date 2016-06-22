@students = []

def input_students
  puts 'Please enter the names of the students, their cohort, their hobby, and country of birth separated by commas and no spaces.'
  puts 'To finish, just hit return twice'

  name = STDIN.gets.strip

  while !name.empty? do
    index = name.split(',')
    @students << { name: index[0], cohort: index[1], hobby: index[2], c_o_b: index[3] }
    @students.length == 1 ? pluralize = 'student' : pluralize = 'students'
    puts "Now we have #{@students.length} #{pluralize}"
    name = STDIN.gets.strip
  end
  @students

  @cohort_array = @students.sort_by { |i| i[1] }

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
  print_students_list
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
  if @students.length == 1
    puts 'The students of Villains Academy'
    puts '-------------------------------------'
  end
end

def print_students_list
  counter = 0
  num = 1

  while counter < @cohort_array.length
    linewidth = 30
    @cohort_array[counter][:name] == ' ' ? name = '?' : name = @cohort_array[counter][:name]
    @cohort_array[counter][:cohort] == ' ' ? cohort = '?' : cohort = @cohort_array[counter][:cohort]
    @cohort_array[counter][:hobby] == ' ' ? hobby = '?' : hobby = @cohort_array[counter][:hobby]
    @cohort_array[counter][:c_o_b] == ' ' ? c_o_b = '?' : c_o_b = @cohort_array[counter][:c_o_b]
    # students.each_with_index do |student, index|
    if name.downcase.start_with?('b') && name.length < 12 && cohort == 'feb'
      puts "#{num}. #{name} (#{cohort} cohort)".ljust(linewidth)
      puts "   Hobby is: #{hobby}".ljust(linewidth)
      puts "   Country of birth: #{c_o_b}".ljust(linewidth)
      num += 1
    end
      counter += 1
    # end
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great students"
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

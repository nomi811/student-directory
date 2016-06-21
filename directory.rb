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
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------------------------------'
end

def print
  counter = 0
  num = 1

  while counter < @students.length
    linewidth = 30
    @students[counter][:name] == ' ' ? name = '?' : name = @students[counter][:name]
    @students[counter][:cohort] == ' ' ? cohort = '?' : cohort = @students[counter][:cohort]
    @students[counter][:hobby] == ' ' ? hobby = '?' : hobby = @students[counter][:hobby]
    @students[counter][:c_o_b] == ' ' ? c_o_b = '?' : c_o_b = @students[counter][:c_o_b]


    # students.each_with_index do |student, index|
    if name.downcase.start_with?('b') && name.length < 12
      # cohort_array = @students.map.with_index{ |name, cohort| cohort }
      # cohort_array.sort_by{ |name, cohort| cohort }
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
  puts "Overall, we have #{@students.count} great students"
end

@students = input_students

print_header
print

print_footer

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

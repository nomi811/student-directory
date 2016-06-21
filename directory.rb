@students = []

def input_students
  puts 'Please enter the names of the students, their cohort, their hobby, and country of birth separated by commas'
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

    # students.each_with_index do |student, index|
    if @students[counter][:name].downcase.start_with?('b') &&    @students[counter][:name].length < 12
      # cohort_array = @students.map.with_index{ |name, cohort| cohort }
      # cohort_array.sort_by{ |name, cohort| cohort }
      puts "#{num}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)".ljust(linewidth)
      puts "Hobby is: #{ @students[counter][:hobby] }".center(linewidth)
      puts "Country of birth: #{ @students[counter][:c_o_b] }".center(linewidth)
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

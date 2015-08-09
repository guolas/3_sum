# List of numbers
list_of_numbers = (-5000.upto 5000).to_a
list_of_numbers = [1, 1, 2, 2, -1, -1, 0, 1, 7, 3, 8, 19, 9, 19, 10]

# Target value
target = 13 

# Sort the list of numbers
list_of_numbers.sort!

# Number of elements in the list
N = list_of_numbers.size

# To keep track of the combinations already used
valid_combinations = {}


# Core code to search for the combinations
0.upto N - 1 do |ii_idx|
  ii = list_of_numbers[ii_idx]
  if ii > target
    break
  end
  # Remaining numbers to check
  remaining_numbers = Hash[list_of_numbers[ii_idx + 1..-1].product([true])]

  (ii_idx + 1).upto N - 1 do |jj_idx|
    jj = list_of_numbers[jj_idx]
    remaining_numbers.delete(jj)
    kk = target - (ii + jj)
    if remaining_numbers.has_key? kk
      combination = [ii, jj, kk]
      unless valid_combinations.has_key? combination
        valid_combinations[combination] = true
      end
    end
  end
end

# Show the result
puts "The target number is #{target}"
puts "And the list of numbers is"
puts list_of_numbers.to_s
puts "--------------"
valid_combinations.each_key do |combination|
  puts combination.to_s
end

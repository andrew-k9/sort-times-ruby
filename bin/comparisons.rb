require_relative "../config/environment.rb"

sorter = Sort.new([3,2,5,10,4,6,1,7,0,9])
sorter.sort
sorter.print_sort_info
sorter.sort(:quick_sort)
puts "#{sorter.sorted_array}"
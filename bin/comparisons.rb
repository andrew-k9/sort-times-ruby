require_relative "../config/environment.rb"

def info(array_type, sorting_method, sorter)
  puts "-------------------------------------"
  puts "Info for #{array_type} using #{sorting_method}"
  puts "Array: #{sorter.original_array[0..10]}..."
  sorter.sort(sorting_method)
  puts "\nSorted array #{sorter.sorted_array[0..10]}..."
  sorter.print_sort_info
  print "\n\n"
end

simple_array = Sort.new()
sorted_array = Sort.new(Sort.populate_array(size: 1000, sort_status: :sorted))
large_array = Sort.new(nil, 1_000_000)

info("a simple array", :sort, simple_array)
info("a simple array", :quick_sort, simple_array)
info("a sorted array", :sort, sorted_array)
info("a sorted array", :quick_sort, sorted_array)
info("a large array", :sort, large_array)
info("a large array", :quick_sort, large_array)
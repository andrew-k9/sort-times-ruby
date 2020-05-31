require_relative "../config/environment.rb"

def info(array_type, sorting_method, sorter)
  puts "-------------------------------------"
  puts "Info for a #{array_type} array using #{sorting_method}"
  puts "Array starting with: #{sorter.original_array[0..4]}"
  sorter.sort(sorting_method)
  sorter.print_sort_info
  print "\n"
end

simple_array = Sort.new()
sorted_array = Sort.new(Sort.populate_array(size: 1000, sort_status: :sorted))
large_array = Sort.new(nil, 1_000_000)
insertion_large_array = Sort.new(nil, 20_000)
bogo_simple_array = Sort.new(nil, 5)
bogo_sorted_array = Sort.new(nil, 5)
bogo_large_array = Sort.new(nil, 10)

info("simple", :sort, simple_array)
info("simple", :quick_sort, simple_array)
info("simple", :merge_sort, simple_array)
info("simple", :insertion_sort, simple_array)
info("simple", :bogo_sort, bogo_simple_array)
info("sorted", :sort, sorted_array)
info("sorted", :quick_sort, sorted_array)
info("sorted", :merge_sort, sorted_array)
info("sorted", :insertion_sort, sorted_array)
info("sorted", :bogo_sort, bogo_sorted_array)
info("large", :sort, large_array)
info("large", :quick_sort, large_array)
info("large", :merge_sort, large_array)
info("large", :insertion_sort, insertion_large_array)
info("large", :bogo_sort, bogo_large_array)
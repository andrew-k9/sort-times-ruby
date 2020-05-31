# Sorting Algorithms

This app is for comparing the running times of various sorting algorithms, as well
as adding a little more detail on how they work.

## Usage

Modify the `bin/comparisons.rb` to play around with the execution times of the
different sorting functions. As of right now, the only sorts to time are the
built in one, insertion sort, merge sort, quick sort, and bogo sort. Here is
an example of how to see the merge sort's functionality:

```ruby
sort_object = Sort.new(nil, 1_000) # can pass array as first arg
sort_object.info("small array", :merge_sort)
```

You can also create specific arrays from the sort object

```ruby
Sort.populate_array(size: 1_000_000, sort_status: :random, rand_min: 1, rand_max: 10_000)
```

This will create a random array of a million values of elements 1 < x < 10_000.

### Word of Caution

Don't try to run `patched insertion_sort` for a size more than 20_000 elements
and `patched_bogo_sort` for more than `10` elements or your computer may double as a stove
while it's doing it's millions and millions of calculations!


## Installation

As per any ruby project, clone and run `bundle` to install dependencies. To run the program, type
`ruby comparisons.rb` in the directory
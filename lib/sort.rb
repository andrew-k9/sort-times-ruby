class Sort
  attr_reader :original_array, :sorted_array, :time

  # makes a copy of the array for all instances
  def initialize(array = nil, size = 1000)
    @original_array = array.nil? ? Sort.populate_array(size: size) : array.map(&:clone)
  end

  # sorts an array of data given the sorting method as an argument
  # @param sort_method [Symbol, nil] A symbol with the sorting method to use. The method accepts
  #  `:qs`, `:sort` (default sort), `:merge`, or `bogo`
  # @return [Array<Numeric>] @sorted_array
  def sort(sort_method = :sort)
    raise_arg_error(sort_method, "sort") unless %i[quick_sort sort bogo merge].include? sort_method

    result = sort_method == :sort ? sort_method : "patched_#{sort_method}".to_sym
    update_sorted_array_and_time(result)
  end

  def print_sort_info
    puts "For this array of size #{@original_array.length}, it took #{@time} ms to sort"
  end

  class << self
    # fills an array up with values
    # @param size [Integer] number of values in the new array
    # @param sort_status [Symbol, :random] the type of sort to be used, see #sort
    # @param rand_min [Integer, -1000] minimum value a_i \in A
    # @param rand_max [Integer, 1000] maximum value of a_i \in A
    # @return [Array<Numeric>] a new array filled with values given the parameters
    def populate_array(size:, sort_status: :random, rand_min: -1000, rand_max: 1000)
      sort_status == :sorted ? [*1..size] : Array.new(size) { rand(rand_min..rand_max) }
    end
  end

private

  # times the execution of a sort function called on array
  # @param sort_method [Symbol, nil] A symbol with the sorting method to use, see #sort
  # @return [Array<Numeric>] @sorted_array
  def update_sorted_array_and_time(sort_method)
    start = Time.now
    @sorted_array = @original_array.send(sort_method)
    finish = Time.now
    @time = finish - start
    @sorted_array
  end

  def raise_arg_error(arg, caller)
    raise ArgumentError, "`#{arg}` not defined for #{caller}"
  end
end

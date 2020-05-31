class Array
  # makes a copy of the array to apply merge sort to
  def patched_insertion_sort
    array_coppy = map(&:clone)
    array_coppy.patched_insertion_sort!
  end

  # destructively calls merge sort
  def patched_insertion_sort!
    return self if empty?

    insertion_private
  end

private

  # while iterating through an array, it will push a value, a_i, less than the
  # the previous value down to a place such that A[a_j .. a_{i - 1}] < a_i <=
  # A[a_{i + 1} .. a_max] for all i in A
  # rubocop:disable all
  def insertion_private
    return self if length < 2

    i = 1
    while i < length
      j = i
      while self[j] < self[j - 1] && j > 0
        self[j - 1], self[j] = self[j], self[j - 1]
        j -= 1
      end
      i += 1
    end
    self
  end
  # rubocop:enable all
end

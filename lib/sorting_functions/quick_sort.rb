class Array
  # makes a copy of the array to apply quicksort to
  def patched_quick_sort
    array_coppy = map(&:clone)
    array_coppy.patched_quick_sort!
  end

  # destructively calls quicksort
  def patched_quick_sort!
    return self if empty?

    quick_sort_private(0, length - 1)
  end

private

  # calls partition to sort an array of ordinal data.
  # @param leftmost_index  [Integer] the left most index of the sub-array
  # @param rightmost_index [Integer] the right most index of the sub-array
  # @return [Array<Ordinal>] the sorted array
  def quick_sort_private(leftmost_index, rightmost_index)
    return if leftmost_index > rightmost_index

    pivot_index = partition_private(leftmost_index, rightmost_index)
    quick_sort_private(leftmost_index, pivot_index - 1)
    quick_sort_private(pivot_index + 1, rightmost_index)
    self
  end

  # given the starting and ending portions of an array, it will
  # sort the two sides of the array such that each self[leftmost..pivot - 1] < self[pivot]
  # and each self[pivot + 1..rightmost] >= self[pivot]
  # @param leftmost_index  [Integer] the left most index of the sub-array
  # @param rightmost_index [Integer] the right most index of the sub-array
  # @return [Integer] the value of the pivot
  # rubocop:disable all
  def partition_private(leftmost_index, rightmost_index)
    i = leftmost_index + 1
    pivot = self[leftmost_index]  # the pivot can be chosen a number of different ways
    j = i
    while j <= rightmost_index
      # if the value is less than the pivot value, go search
      if self[j] < pivot
        self[i], self[j] = self[j], self[i]
        i += 1
      end
      j += 1
    end
    # puts the pivot into the correctly sorted area
    self[leftmost_index], self[i - 1] = self[i - 1], self[leftmost_index]
    i - 1
  end
  # rubocop:enable all
end

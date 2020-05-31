class Array
  # makes a copy of the array to apply merge sort to
  def patched_merge_sort
    array_coppy = map(&:clone)
    array_coppy.patched_merge_sort!
  end

  # destructively calls merge sort
  def patched_merge_sort!
    return self if empty?

    merge_sort_private(self)
  end

private

  # rubocop:disable all
  def merge_two_subarrays(left_sub_array, right_sub_array)
    sorted = []
    i, j = 0, 0

    while i < left_sub_array.length && j < right_sub_array.length
      if left_sub_array[i] < right_sub_array[j]
        sorted << left_sub_array[i]
        i += 1
      else
        sorted << right_sub_array[j]
        j += 1
      end
    end

    sorted += left_sub_array[i..-1] if i < left_sub_array.length
    sorted += right_sub_array[j..-1] if j < left_sub_array.length
    sorted
  end

  def merge_sort_private(array)
    return array if array.length < 2

    midpoint = (array.length / 2.0).ceil # to consistently put midpoint in the right sub_array
    left_sorted_sub_array = merge_sort_private(array[0..midpoint - 1])
    right_sorted_sub_array = merge_sort_private(array[midpoint..-1])
    merge_two_subarrays(left_sorted_sub_array, right_sorted_sub_array)
  end
  # rubocop:enable all
end

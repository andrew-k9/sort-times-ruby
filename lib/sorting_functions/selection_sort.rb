class Array
  # makes a copy of the array to apply selection sort to
  def patched_selection_sort
    array_coppy = map(&:clone)
    array_coppy.patched_selection_sort!
  end

  # destructively calls selection sort
  def patched_selection_sort!
    return self if empty?

    selection_private
  end

private

  # selection sort simply finds the minimum element of the array and swaps it to the start.
  # the subsequent loop looks at self[i..length] and puts the sorted element at i
  # rubocop:disable all
  def selection_private
    return self if length < 2

    i = 0
    while i < length - 1
      minimum_index = i
      j = i + 1
      while j < length
        minimum_index = j if self[j] < self[minimum_index]
        j += 1
      end
      self[minimum_index], self[i] = self[i], self[minimum_index]
      i += 1
    end
    self
  end
  # rubocop:enable all
end

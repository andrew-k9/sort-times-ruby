class Array
  # makes a copy of the array to apply selection sort to
  def patched_bubble_sort
    array_coppy = map(&:clone)
    array_coppy.patched_selection_sort!
  end

  # destructively calls selection sort
  def patched_bubble_sort!
    return self if empty?

    bubble_private
  end

private

  # bubble sort simply swaps elements if they are in the wrong order.
  # the array self[0..i] is in the correct order, and self[i..length] is then examined
  # rubocop:disable all
  def bubble_private
    return self if length < 2

    i = 0
    while i < length
      j = 0
      while j < length - i - 1
        self[j], self[j + 1] = self[j + 1], self[j] if self[j] > self[j + 1]
        j += 1
      end
      i += 1
    end
    self
  end
  # rubocop:enable all
end

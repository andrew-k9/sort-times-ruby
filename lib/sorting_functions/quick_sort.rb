class Array
  def patched_quick_sort
    array_coppy = map(&:clone)
    array_coppy.patched_quick_sort!
  end

  def patched_quick_sort!
    return self if empty?

    quick_sort_private(0, length - 1)
  end

private

  def quick_sort_private(leftmost_index, rightmost_index)
    return self if leftmost_index > rightmost_index

    pivot_index = partition_private(leftmost_index, rightmost_index)
    quick_sort_private(leftmost_index, pivot_index - 1)
    quick_sort_private(pivot_index + 1, rightmost_index)
  end

  def partition_private(leftmost_index, rightmost_index)
    i = leftmost_index + 1
    pivot = self[leftmost_index]
    j = i
    while j <= rightmost_index
      if self[j] < pivot
        self[i], self[j] = self[j], self[i]
        i += 1
      end
      j += 1
    end
    self[leftmost_index], self[i - 1] = self[i - 1], self[leftmost_index]
    i - 1
  end

  def middle
    length / 2
  end
end

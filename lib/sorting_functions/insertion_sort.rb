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

  # rubocop:disable all
  def insertion_private
    self
  end
  # rubocop:enable all
end

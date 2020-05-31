class Array
  # makes a copy of the array to apply merge sort to
  def patched_bogo_sort
    array_coppy = map(&:clone)
    array_coppy.patched_bogo_sort!
  end

  # destructively calls merge sort
  def patched_bogo_sort!
    return self if empty?

    bogo_private
  end

private

  # Sorts the
  def bogo_private
    return self if length < 2

    shuffled = shuffle
    shuffled == sort ? shuffled : bogo_private
  end
end

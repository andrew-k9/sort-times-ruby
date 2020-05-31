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

  # terrible sort, don't use in prod! It will average case be
  # n! (mathematically, n*n! but n! dominates) time, meaning that
  # the average case, it has a 1/n! chance to get the right value (if `.shuffle` is 100% random which it isn't).
  # Ex if there is a 10 element array, it will have a 1/10! = 1/(10*9*8*...*1) = 1/3_628_800
  # chance to get it correct O.o
  def bogo_private
    return self if length < 2

    shuffled = self
    shuffled = shuffle while shuffled != sort
  end
end

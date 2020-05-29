require_relative "spec_helper.rb"

describe Array do
  SIZE = 100
  I_MIN = -1_000_000
  I_MAX = 1_000_000
  unsorted_regular = Array.new(SIZE) { rand(I_MIN..I_MAX) }
  sorted_regular = unsorted_regular.sort

  describe "#patched_quick_sort" do
    it "actually exists, can't quick sort if there ain't no quick sort" do
      expect(Array.new(1)).to respond_to(:patched_quick_sort)
    end

    it "sorts the random array" do
      expect(unsorted_regular.patched_quick_sort).to eq(sorted_regular)
    end

    it "does not mutate the original array" do
      a = [1,8,2,4,7,6,4,0]
      b = a.patched_quick_sort
      expect(a).should_not eq(b)
    end
  end
end
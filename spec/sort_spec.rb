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
      expect(a).not_to eq(b)
    end
  end

  describe "#patched_quick_sort!" do
    it "also actually exists" do
      expect(Array.new(1)).to respond_to(:patched_quick_sort!)
    end

    it "mutates the array" do
      a = Array.new(SIZE) { rand(I_MIN..I_MAX) }
      b = a.patched_quick_sort!
      expect(a).to eq(b)
    end
  end

  describe "#patched_merge_sort" do
    it "actually exists" do
      expect(Array.new(1)).to respond_to(:patched_merge_sort)
    end

    it "sorts the random array" do
      expect(unsorted_regular.patched_merge_sort).to eq(sorted_regular)
    end

    it "does not mutate the original array" do
      a = [1,8,2,4,7,6,4,0]
      b = a.patched_merge_sort
      expect(a).not_to eq(b)
    end
  end

  describe "#patched_insertion_sort" do
    it "actually exists" do
      expect(Array.new(1)).to respond_to(:patched_insertion_sort)
    end

    it "sorts the random array" do
      expect(unsorted_regular.patched_insertion_sort).to eq(sorted_regular)
    end

    it "does not mutate the original array" do
      a = [1,8,2,4,7,6,4,0]
      b = a.patched_insertion_sort
      expect(a).not_to eq(b)
    end
  end

  describe "#patched_bogo_sort" do
  it "actually exists" do
    expect(Array.new(1)).to respond_to(:patched_bogo_sort)
  end

  it "sorts the random array" do
    # it would be madness to sort a million datapoints like that...
    a = Array.new(100) { rand(-100..100) }
    expect(a.patched_bogo_sort).to eq(a.sort)
  end

  it "does not mutate the original array" do
    a = [1,8,2,4,7,6,4,0]
    b = a.patched_insertion_sort
    expect(a).not_to eq(b)
  end
end

end

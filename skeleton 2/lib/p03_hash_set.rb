class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count + 1 > num_buckets
    hash = key.hash
    
    if !self.include?(key)
      self[hash] << key
      @count += 1
    end

  end

  def include?(key)
    hash = key.hash
    self[hash].include?(key)
  end

  def remove(key)
    hash = key.hash
    
    if self.include?(key)
      self[hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # p (num % num_buckets)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.flatten
    @store = Array.new(num_buckets*2) {Array.new}
    
    temp.each do |ele|
      self[ele] << ele
    end
  end
end

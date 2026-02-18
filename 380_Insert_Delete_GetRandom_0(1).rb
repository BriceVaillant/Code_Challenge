class RandomizedSet
  def initialize()
    @hash_map = {}
    @hash_list = []
  end

  def insert(val)
    return false if @hash_map.key?(val)

    @hash_map[val] = @hash_list.length
    @hash_list << val
    true
  end

  def remove(val)
    return false unless @hash_map.key?(val)
    index_to_remove = @hash_map[val]
    last_index = @hash_map[@hash_list.last]
    @hash_map[val] = last_index
    @hash_map[@hash_list.last] = index_to_remove

    @hash_list[last_index], @hash_list[index_to_remove] = @hash_list[index_to_remove], @hash_list[last_index]
    @hash_list.delete_at(last_index)
    @hash_map.delete(val)

    true
  end

  def get_random()
    @hash_list.sample
  end
end

# Your RandomizedSet object will be instantiated and called as such:
obj = RandomizedSet.new()
val1 = 15
val2 = 12
val3 = 13
val4 = 1
val5 = 2
param_1a = obj.insert(val1)

param_1b = obj.insert(val2)

param_1c = obj.insert(val3)
param_1d = obj.insert(val4)
param_1e = obj.insert(val5)

print(obj.remove(val3))
p(obj)
# param_2 = obj.remove(val3)
# print(param_2, " has been removed", "\n")
# print(obj, "\n")
# param_3 = obj.get_random()
# print("random ", param_3)

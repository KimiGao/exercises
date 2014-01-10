#
# 实现简单的二分查找（递归）：
#
# 给定一个数和有序数组，返回该数在数组中的下标
#

class BinarySearch

  attr_accessor :origin_array

  def initialize(array)
    @origin_array = array.is_a?(Array) ? array : []
  end

  def fetch_index(number, low = 0, high = origin_array.length - 1)

    return -1 if low > high

    mid = (low + high)/2

    result = case
             when origin_array[mid] == number
               mid
             when origin_array[mid] > number
               fetch_index(number, low, mid - 1)
             else
               fetch_index(number, mid + 1, high)
             end

    return result
  end
end

binary_search = BinarySearch.new([0,1,2,3,4,5,6,7,9,10])
p binary_search.fetch_index(5) == 5

binary_search = BinarySearch.new([10,11,12,13,14,15,16,17,19,10])
p binary_search.fetch_index(16) == 6

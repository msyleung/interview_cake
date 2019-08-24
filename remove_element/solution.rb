# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}

## A very C approach to solving this problem :(
# Runtime: 28 ms, faster than 97.46% of Ruby online submissions for Remove Element.
# Memory Usage: 9.3 MB, less than 100.00% of Ruby online submissions for Remove Element.

def remove_element(nums, val)
    index = 0
    while index < nums.length
        if nums[index] == val
            nums.delete_at(index)
            index -= 1
        end
        index += 1
    end
    nums.length
end

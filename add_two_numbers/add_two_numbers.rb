# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def convert_to_int(list)
    count = 1
    int = 0
    while list.nil? == false
        tmp = list.val.to_s.to_i
        meow = tmp * count
        int += meow
        count *= 10
        list = list.next
    end
    return int
end

def solve_math(int1, int2)
    return int1 + int2
end

def convert_to_list(int)
    list = ListNode.new(int % 10)
    int = int / 10
    head = list
    while int > 0
        list.next = ListNode.new(int % 10)
        list = list.next
        int = int / 10
    end
    head
end

def add_two_numbers(l1, l2)
    int1 = convert_to_int(l1)
    int2 = convert_to_int(l2)
    answer = solve_math(int1, int2)
    answer_list = convert_to_list(answer)
    return answer_list
end

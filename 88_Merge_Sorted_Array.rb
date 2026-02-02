nums1 = [1,2,3,0,0,0]
m = 3
nums2 = [2,5,6]
n = 3

# def merge(nums1, m, nums2, n)
#     nums1.replace((nums1.first(m) + nums2).sort)
# end

def merge(nums1, m, nums2, n)
    counter = m + n -1
    m_pointer = m - 1
    n_pointer = n - 1
    while n_pointer >= 0
        if m_pointer >= 0 && nums1[m_pointer] > nums2[n_pointer]
            nums1[counter] = nums1[m_pointer]
            m_pointer -= 1
        else
            nums1[counter] = nums2[n_pointer]
            nums2.pop
            n_pointer -= 1
        end
    counter -= 1
    end
    return nums1
end

p(merge(nums1, m, nums2, n))

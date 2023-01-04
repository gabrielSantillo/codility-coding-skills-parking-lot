# Write a function solution that, given two integers A and B, returns a string containing exactly A letters 'a' and exactly B letters 'b' with no three consecutive letters being the same (in other words, neither "aaa" nor "bbb" may occur in the returned string).

# Examples:

# 1. Given A = 5 and B = 3, your function may return "aabaabab". Note that "abaabbaa" would also be a correct answer. Your function may return any correct answer.

# 2. Given A = 3 and B = 3, your function should return "ababab", "aababb", "abaabb" or any of several other strings.

# 3. Given A = 1 and B = 4, your function should return "bbabb", which is the only correct answer in this case.

# Assume that:

# A and B are integers within the range [0..100];
# at least one solution exists for the given A and B.
# In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.

def solution(A, B):
    # initializing a variable as an empty list
    ans = [] 

    # while A or B has any positive value the loop will continue
    while A or B: 
        # if to check if the len of the array is higher or equal to 2 and if the last and the second last index are equal
        if len(ans) >= 2 and ans[-1] == ans[-2]: 
            # assigning to the writeA variable the value of True
            writeA = True
        else:
            # assigning the value of true or false to the variable writeA. If A >= B then True, if not then False
            writeA = A >= B

        # if writeA is True, append the letter a to the ans list and subtract 1 from A variable
        if writeA:
            A -= 1
            ans.append('a')
        # if writeA is false, append the letter b to the ans list and subtract 1 from B variable
        else:
            B -= 1
            ans.append('b')

    # turning the list into a string
    return "".join(ans)

solution(1, 4)
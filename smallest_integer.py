# Write a function:

# def solution(A)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].

def solution(A):
    s = set(A) # setting the array to have an unique collection
    m = max(A) + 2 # finding the highest number inside the array and adding 2 to it
    for N in range(1, m): # looping the array from 1 to the m, that is the highest number inside the array after adding 2 to it
        if N not in s: # if N is not in the original array, this means that this is the smallest integer number that doesn't occur in A
            return print(N) # returning the element N in case of true, which means N doesn't occur in A and is the smallest positive integer
    return print(1) # return 1 in case you don't find 1 in A, which is the smallest integer that doesn't occur in A

solution([-1, -2, 2, 3])
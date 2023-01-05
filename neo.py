def solution(arr):
    sums = 0

    for i in arr:
        if i % 4 == 0:
              sums = sums + i
  
    return sums

def solution(S, C):
    # splitting the string after each "\n" into a index of a list
    rows = S.split("\n")
    csv_list = []
    # looping the list
    for row in rows:
        # splitting each word after "," into a index of a list
        columns = row.split(",")
        # appending to the list initialized as empty
        csv_list.append(columns)

    # looping throuth the first list inside csv_list
    for i in range(len(csv_list[0])):
        # grabbing the name of the column
        column_name = csv_list[0][i] 
        # checking to see if column_name is "age"
        if column_name == C:
            # Using this float function to symbolize the inf infinite and not fail with negaive numbers only
            max_age = float('-Inf')
            # looping the list but starting from the index 1
            for k in range(1, len(csv_list)):
                # using the function max to identify which value is the biggest
                max_age = max(max_age, int(csv_list[k][i])) 
            return max_age


def solution(A, D):
    # initializing each variable as a list with 12 indexes to represent one year in months
    payment = [0,0,0,0,0,0,0,0,0,0,0,0]
    transfer = [0,0,0,0,0,0,0,0,0,0,0,0]
    count = [0,0,0,0,0,0,0,0,0,0,0,0]

    # looping trough the list A 
    for i in range(len(A)):
        # splitting the the D list after each "-" in 3
        date = D[i].split('-', 3)
        year = int(date[0])
        month = int(date[1])

        # if the year is 2020
        if(year == 2020):
            # if the at i the value is lower than 0
            if(A[i] < 0):
                # In case of True, subtract to the payment list
                payment[month-1] -= A[i]
                # add one to the count list
                count[month-1] += 1
            else:
                # in case of False, add to the transfer list
                transfer[month-1] += A[i]

    # starting the balance as zero
    balance = 0

    # looping all months of the year 
    for i in range(12):
        # balance is equal the transfer less payment
        balance += transfer[i] - payment[i]
        # if count is more than 3 or payment less than 100, subtract 5 from balance
        if count[i] < 3 or payment[i] < 100:
            balance -= 5
    
    return balance


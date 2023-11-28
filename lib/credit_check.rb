card_number = "5541808923795240"

# Your Luhn Algorithm Here

    #Pseudo Code:

    #1.) Double every other digit
    #turn given string into an array of single string elements
    #iterate through that array to turn each element into an integer 
    #OR
    #turn given string into an integer 
    #turn integer into an array of each digit being it's own element

    #iterate through the array using .each_with_index to obtain the number and it's index
    #multiply the number by 2 if the index's position is an even number 

    #2.) If element is greater than 9, sum the digits of that element
    #iterate through the array from the first step 
    #create a conditional for if the element is < 9, keep that element
    #else, if the element is > 9, sum the digits of that element
    #return as a new array 

    #3.) Take the sum of all the digits 
    #use the .sum enumerable on the array from the last step

    #4.) If the sum is divisible by ten, the number is valid
    #check to see if the sum from the last step is a multiple of ten using modulo operator (%)
    #if so, return the valid output string - if not, return the invalid output string

def is_valid?(cc_num)
    card_number_arr = cc_num.to_i.digits 
    card_number_arr.each_with_index do |num,index|
        card_number_arr[index] = num * 2 if index.odd? 
    end
    card_number_arr.map! { |num| num > 9 ? num - 9 : num }
    card_number_arr.sum % 10 == 0
end

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"

p is_valid?(card_number)

#Valid:
test1 = 5541808923795240
test2 = 4024007136512380
test3 = 6011797668867828

#Invalid: 
test4 = 5541801923795240 
test5 = 4024007106512380
test6 = 6011797668868728

p is_valid?(test1)
p is_valid?(test2)
p is_valid?(test3)
p is_valid?(test4)
p is_valid?(test5)
p is_valid?(test6)
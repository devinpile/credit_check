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

def luhn_algorithm(cc_num)
    formatted_cc_num = format(cc_num)
    adjusted_cc_num = double_every_other_index_position(formatted_cc_num)
    re_adjusted_cc_num = format_to_single_digit(adjusted_cc_num)
    cc_check = check_validity(re_adjusted_cc_num)
    response(cc_check, cc_num)
end

def format(card_number)
    card_number.chars.map do |num|
        num.to_i
    end
end

def double_every_other_index_position(array)
    array.each_with_index do |num,index|
        array[index] = num * 2 if index.even? 
    end
end

def format_to_single_digit(array)
    array.map! { |num| num > 9 ? num - 9 : num }
end

def check_validity(array)
    array.sum % 10 == 0
end

def response(boolean, cc_num)
    if boolean == true
        "The number #{cc_num} is valid!"
    else
        "The number #{cc_num} is invalid!"
    end
end

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"

p luhn_algorithm(card_number)

#Valid:
test1 = 5541808923795240
test2 = 4024007136512380
test3 = 6011797668867828

#Invalid: 
test4 = 5541801923795240 
test5 = 4024007106512380
test6 = 6011797668868728

# p luhn_algorithm(test2)
# p luhn_algorithm(test3)
# p luhn_algorithm(test1)
# p luhn_algorithm(test4)
# p luhn_algorithm(test5)
# p luhn_algorithm(test6)

class Credit_card
    attr_reader :card_number, :limit 

    def initialize(card_number, limit)
        @card_number = card_number
        @limit = limit
    end

    def is_valid?
      luhn_algorithm(@card_number)
    end

    def last_four
        arr = @card_number.chars 
        [arr[-4],arr[-3],arr[-2],arr[-1]].join('')
    end

    def luhn_algorithm(cc_num)
        formatted_cc_num = format(cc_num)
        adjusted_cc_num = double_every_other_index_position(formatted_cc_num)
        re_adjusted_cc_num = format_to_single_digit(adjusted_cc_num)
        cc_check = check_validity(re_adjusted_cc_num)
    end
    
    def format(card_number)
        card_number.chars.map do |num|
            num.to_i
        end
    end
    
    def double_every_other_index_position(array)
        array.each_with_index do |num,index|
            array[index] = num * 2 if index.even? 
        end
    end
    
    def format_to_single_digit(array)
        array.map! { |num| num > 9 ? num - 9 : num }
    end
    
    def check_validity(array)
        array.sum % 10 == 0
    end
end

p Credit_card.new("5541808923795240", 15000).card_number # expect "5541808923795240"
p Credit_card.new("5541808923795240", 15000).limit # expect 15000
p Credit_card.new("5541808923795240", 15000).is_valid? # expect true
p Credit_card.new("5541808923795240", 15000).last_four # expect "5240"
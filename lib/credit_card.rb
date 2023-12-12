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
require './lib/bank'
require './lib/credit_card'

RSpec.describe Credit_card do 
    before do 
        @bank = Bank.new('Wells Fargo')
        @valid_credit_card = Credit_card.new("5541808923795240", 15000)
        @invalid_credit_card = Credit_card.new("4024007106512380", 15000)
    end 

    describe 'exists and has readable attributes' do 
        it 'exists' do
            expect(@bank).to be_an_instance_of Bank
        end

        it 'has readable attributes' do 
            expect(@bank.name).to eq "Wells Fargo"
        end 
    end 

    describe 'valid transaction' do 
        it 'knows a transaction is invalid when credit card is invalid' do
            expect(@bank.valid_transaction?(100, @invalid_credit_card)).to be false
        end

        it 'knows a transaction is invalid when the amount is over the limit' do 
            expect(@bank.valid_transaction?(20000, @valid_credit_card)).to be false
        end 

        it 'knows when a transaction is valid' do 
            expect(@bank.valid_transaction?(11000, @valid_credit_card)).to be true 
        end 
    end 
end 

FactoryGirl.define do 
	factory :charge do
	      paid true
		  amount 1
		  currency 'inr'
		  refunded false
    end
    factory :customer do
	    first_name 'Mark'
	  	last_name 'Ryder'
	  	email_address 'mark@gmail.com'
	  	after(:create) do |liztng|
	      FactoryGirl.create(:charge)
	    end		
    end
	
end
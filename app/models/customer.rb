class Customer < ActiveRecord::Base
	has_many :charges
    attr_accessor :largest_amount
	
	def charge_obj
		self.charges.each do |charge|
			charge.largest_amount = 'largest amount'
		end
	end
end

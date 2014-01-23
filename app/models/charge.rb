class Charge < ActiveRecord::Base
	belongs_to :customer
	attr_accessor :largest_amount
end

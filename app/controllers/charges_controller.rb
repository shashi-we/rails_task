class ChargesController < ApplicationController

  def index
  	@customers = Customer.all.to_a 
  	@failed_charges = []
  	@succesful_charges = []
  	@dispute_charges = []
  	@customers.each do |customer|
  	  @failed_charges << customer.charges.where(paid: false, refunded: false)
  	  @succesful_charges << customer.charges.where(paid: true, refunded: false)
  	  @dispute_charges << customer.charges.where(paid: true, refunded: true)
  	end
  end

  def new
  	@customers = Customer.all.to_a 
  end

  def create
  	@customer = Customer.find(params[:customer_id])
  	if !params[:amount].blank? && !params[:currency].blank?
		@customer.charges.each do |charge|
			charge.create!(:amount=>params[:amount],:currency=>params[:currency])
        end
        redirect_to charges_path
    else
    	flash[:notice] = "Something went wrong."
    	redirect_to new_charge_path
    end
  end

end

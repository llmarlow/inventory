class QuantitiesController < ApplicationController
	before_action :authenticate_user!
	def new
		@quantity = Quantity.new
	end

	def create
		@floss = Floss.find(params[:floss_id])
		@quantity = @floss.quantities.build(quantity_params)
		@quantity.user = current_user
		@quantity.save
		respond_to do |format|
		  if @quantity.save
		      format.html { redirect_to flosses_path, notice: 'Floss successfully added.' }
		      format.json
		      format.js
	    	else
		      format.html { redirect_to flosses_path, notice: 'Floss not added' }
		      format.json
		      format.js
	    	end
  		end
	end

	def update
	  @floss = Floss.find(params[:floss_id])
	  respond_to do |format|
	    if @quantity.update_attributes(quantity_params)
	      format.html { redirect_to flosses_path, notice: 'Floss successfully updated.' }
	      format.json
	      format.js
	    else
	      format.html { redirect_to flosses_path, notice: 'Floss not updated' }
	      format.json
	      format.js
	    end
	  end
	end

	private

	def quantity_params
	  params.require(:quantity).permit(:quantity)
	end
end

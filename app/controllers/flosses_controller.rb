class FlossesController < ApplicationController
	before_action :authenticate_user!

	def new
      @floss = Floss.new
	end

	def create
	  @floss = current_user.flosses.create(floss_params)
	  redirect_to flosses_path
  	end

  	def index
  		@flosses = current_user.flosses.order( 'flosses.colour DESC' )
      respond_to do |format|
      format.html
      format.json
    end
  	end

  	def update
    @floss = Floss.find(params[:id])
    respond_to do |format|
      if @floss.update_attributes(floss_params)
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

  def floss_params
    params.require(:floss).permit(:brand, :colour, :quantity)
  end
end

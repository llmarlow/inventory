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
  	end

  private

  def floss_params
    params.require(:floss).permit(:brand, :colour, :quantity)
  end
end

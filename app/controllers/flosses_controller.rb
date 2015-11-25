class FlossesController < ApplicationController
	before_action :authenticate_user!

	def new
      @floss = Floss.new
	end

	def create
	  @floss = Floss.new(floss_params)
    @floss.save
	  redirect_to flosses_path
  end

  def index
    @quantity = Quantity.new
    @user = current_user
    if params[:brand]
      @flosses = Floss.where(:brand => params[:brand])
    else
      @flosses = Floss.all
    end
    respond_to do |format|
    format.html
    format.json
  end
end

  	def update
    @quantity = Quantity.find(params[:id])
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
    params.require(:floss).permit(:brand, :colour)
  end
end

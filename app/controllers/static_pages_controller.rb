class StaticPagesController < ApplicationController
	def index
	  if current_user
        redirect_to flosses_path
      else
      # business logic here
      end

	end
end

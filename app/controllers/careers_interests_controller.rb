class CareersInterestsController < ApplicationController
	
	def index
		@carrer_interests = CareersInterest.all
	end

	def new
		@carrer_interest = CareersInterest.new
		@carrer_interest.build_attachment
	end

	def create
		@carrer_interest = CareersInterest.new(careers_interest_params)
		if @carrer_interest.save

		else
			render :new
		end
	end

	private

	def careers_interest_params
    params.require(:careers_interest).permit(:first_name, :last_name, :phone, :city, :state, :email, :skills, :attachment_attributes => [ :file ] )
  end

end

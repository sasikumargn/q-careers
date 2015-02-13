class CareersInterestsController < ApplicationController
	
	def index
		@carrer_interests = CareersInterest.all
	end

	def new
		@carrer_interest = CareersInterest.new
	end

end

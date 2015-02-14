class CareersInterestsController < ApplicationController

	layout 'poodle/public'
  before_filter :set_navs

	def index
		@career_interests = CareersInterest.all
	end

	def new
		@career_interest = CareersInterest.new
		@career_interest.build_attachment
	end

	def create
		@career_interest = CareersInterest.new(careers_interest_params)
		if @career_interest.save

		else
			render :new
		end
	end

	private

	def careers_interest_params
    params.require(:careers_interest).permit(:first_name, :last_name, :phone, :city, :state, :email, :skills, :attachment_attributes => [ :file ] )
  end

 	def set_navs
    set_nav("Career Interst")
  end

end

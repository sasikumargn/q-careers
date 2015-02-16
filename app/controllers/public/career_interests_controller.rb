class Public::CareerInterestsController < Public::BaseController

  before_filter :get_details

  def show
  end

  def confirm
    if @career_interest.confirm!
      redirect_to public_event_career_interest_path(@career_interest)
    else
      render action: :show, notice: "Some Error!"
    end
  end

  private

  def get_details
    @event = Event.find_by_slug(params[:event_id])
    @career_interest = CareerInterest.find_by_id(params[:id])
    @fresher = @career_interest.candidate
  end

  def set_navs
    set_nav("public/events")
  end

end


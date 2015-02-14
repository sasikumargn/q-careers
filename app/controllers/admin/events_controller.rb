class Admin::EventsController < Poodle::AdminController

  private

  def permitted_params
    params[:event].permit(:name, :date, :venue ,:description)
  end

end

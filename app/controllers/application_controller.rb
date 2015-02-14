class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ## This filter method is used to fetch current user
  before_filter :current_user, :set_default_title, :stylesheet_filename, :javascript_filename

  include Poodle::ApplicationHelper
  helper Poodle::ApplicationHelper

  def set_default_title
    set_title("Q-Careers")
  end

  def stylesheet_filename
    @stylesheet_filename = "application"
  end

  def javascript_filename
    @javascript_filename = "application"
  end

end

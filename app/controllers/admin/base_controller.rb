class Admin::BaseController < ApplicationController
  layout 'poodle/application'
  before_filter :require_admin, :set_navs, :parse_pagination_params

  def stylesheet_filename
    @stylesheet_filename = "application"
  end

  def javascript_filename
    @javascript_filename = "application"
  end

end

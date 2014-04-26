class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include NavLinkHelper

  def disable_topic_header
  	@disable_topic_header = true
  end
  
end
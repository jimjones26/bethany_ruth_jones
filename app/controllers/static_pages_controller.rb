class StaticPagesController < ApplicationController
	before_filter :disable_topic_header, only: [:home]

  def home
  end

end
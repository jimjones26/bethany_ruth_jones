class StaticPagesController < ApplicationController
	before_filter :disable_topic_header, only: [:home, :placeholder]

  def home
  end

end
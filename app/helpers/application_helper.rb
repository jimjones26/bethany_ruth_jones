module ApplicationHelper

	# Returns the full title on a per-page basis			# documentation comment
	def full_title(page_title)								# method definition
		base_title = "Bethany Ruth Jones | Area Manager"	# variable assigment
		if page_title.empty?								# boolean test
			base_title										# implicit return
		else
			"#{base_title} | #{page_title}"					# string interpolation
		end
	end
end
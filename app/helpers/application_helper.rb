module ApplicationHelper

	# Returns the full title on a per-page basis			# documentation comment
	def full_title(page_title)								# method definition
		base_title = "Bethany Ruth Jones"					# variable assigment
		if page_title.empty?								# boolean test
			base_title										# implicit return
		else
			"#{base_title} | #{page_title}"					# string interpolation
		end
	end

	# creates breadcrumbs
	def breadcrumb_str options
		items = []
		char_sep = "".html_safe
		if(options.size !=0 )
			items <<  content_tag(:li , :class => "active") do
				link_to("Home", root_path) + content_tag(:span, char_sep, :class => "divider")
			end
			options.each do |option|
				option.each do |key, value|
					if !value.nil?
						items << content_tag(:li) do 						
							link_to(key, value) + content_tag(:span, char_sep, :class => "divider")
						end
					else
						items << content_tag(:li, key, :class =>"active")
					end
				end
			end
		else
			items << content_tag(:li, "Home", :class => "active")
		end

		items.join("").html_safe
	end

	def breadcrumb options
		content_tag(:ol, breadcrumb_str(options), :class => "breadcrumb pull-right hidden-xs")
	end

  end
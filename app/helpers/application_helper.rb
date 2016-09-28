module ApplicationHelper

	def get_who_owes_what_block(final_hash)
		final_block = ""
		final_hash.each do |key, value|
			if value > 0
				user1 = User.find_by_id(key)
				final_block << "<div id=\"user_#{user1.id}_block\" class=\"user_owe_block\"><p>#{user1.first_name}</p>"
				final_hash.each do |k, v|
					if key != k && v < 0
						user2 = User.find_by_id(k)
						final_block << "<p><span style=\"color:blue\">gets back " 
						if value.abs > v.abs
							final_block << "$#{v.abs}"
							final_hash[k] = 0
						else
							final_block << "$#{value.abs}"
							final_hash[k] = -(v.abs - value.abs)
						end
						
						final_block << " from #{user2.first_name}</span></p>"
					end
				end
				final_block << "</div>"
			end
		end unless final_hash.blank?
		return final_block.html_safe
	end

end

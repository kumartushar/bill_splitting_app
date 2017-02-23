module ControllerCommon
	def Log(e, message="")
		Rails.logger.error "#{message}: #{e.message}"
		e.backtrace[0..13].each {|line| Rails.logger.error line}
	end
end
class DashboardController < ApplicationController
  def home
  	begin
  		@final_hash = BillEvent.cal_who_owes_what
  		raise "No Data Error"
  	rescue Exception => e
  		LogException.Log(e, "Error in home action of DashboardController")
  	end
  end
end

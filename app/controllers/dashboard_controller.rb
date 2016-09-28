class DashboardController < ApplicationController
  def home
  	@final_hash = BillEvent.cal_who_owes_what
  end
end

class BillEventsController < ApplicationController
  def new
  	begin
  		@bill_event = BillEvent.new
  	rescue Exception => e
  		Rails.logger.error "#{message}: #{e.message}"
  	end
  end

  def create
  	begin
  		bill_event = BillEvent.create_bill_event(bill_event_params)
  		EventPresentee.add_event_presentees(params[:presentee], bill_event.id)  unless bill_event.blank?
  		flash[:success] = "Bill Event Added Successfully."
  	rescue Exception => e
      flash[:error] = "Error while adding bill event"
  		Rails.logger.error "message: #{e.message}"
  	ensure
  		redirect_to ("/home")
  	end
  end

  private

  def bill_event_params
    params.require(:bill_event).permit(:event_type, :event_date, :location, :total_amount)
  end

end

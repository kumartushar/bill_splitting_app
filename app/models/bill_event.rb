class BillEvent < ActiveRecord::Base
	has_many :event_presentees
	has_many :users, through: :event_presentees

	validates :event_type, :total_amount, :presence => true


	def self.create_bill_event(event_params)
		event_params[:event_date] = Date.strptime(event_params[:event_date], "%m/%d/%Y")
		BillEvent.create(event_params)
	end

	def self.cal_who_owes_what
		final_hash = {}
		bill_events = BillEvent.all
		bill_events.each do |bill_event|
			event_presentees = bill_event.event_presentees
			individual_share = (bill_event.total_amount)/(event_presentees.count)
			event_presentees.each do |presentee_data|
				user_id = presentee_data.user_id
				owe_val = presentee_data.contribution - individual_share
				final_hash[user_id] = final_hash.has_key?(user_id) ? final_hash[user_id] + owe_val : owe_val
			end
		end unless bill_events.blank?
		final_hash.update(final_hash){|key,value| value.truncate(2).to_f}
	end
end

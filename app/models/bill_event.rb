class BillEvent < ActiveRecord::Base
	has_many :event_presentees
	has_many :users, through: :event_presentees

	validates :event_type, :total_amount, :presence => true


	def self.create_bill_event(event_params)
		BillEvent.create(event_params)
	end
end

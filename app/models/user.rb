class User < ActiveRecord::Base
	has_many :event_presentees
	has_many :bill_events, through: :event_presentees

	validates :first_name, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

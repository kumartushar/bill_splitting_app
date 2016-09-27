class EventPresentee < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill_event

  def self.add_event_presentees(event_presentees_hash, event_id)
  	event_presentees_hash.delete_if {|k,v| v["name"].blank? }
  	event_presentees_hash.each do |user_id, cont_hash|
  		obj = EventPresentee.new({contribution: cont_hash[:contribution]})
  		obj.user_id = user_id
  		obj.bill_event_id = event_id
  		obj.save
  	end unless event_presentees_hash.blank?
  end
end

class CreateBillEvents < ActiveRecord::Migration
  def change
    create_table :bill_events do |t|
      t.text :event_type
      t.date :event_date
      t.text :location
      t.decimal :total_amount

      t.timestamps
    end
  end
end

class CreateEventPresentees < ActiveRecord::Migration
  def change
    create_table :event_presentees do |t|
      t.references :user, index: true
      t.references :bill_event, index: true
      t.decimal :contribution

      t.timestamps
    end
  end
end

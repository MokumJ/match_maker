class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.date :day
      t.string :pairs, array: true, default: []

      t.timestamps
    end
  end
end

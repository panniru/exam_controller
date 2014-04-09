class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :course
      t.string :semester
      t.string :event
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end

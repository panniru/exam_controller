class CreateSeatAllotments < ActiveRecord::Migration
  def change
    create_table :seat_allotments do |t|
      t.string :dept
      t.string :semester
      t.date :exam_date
      t.string :roll_from
      t.string :roll_to
      t.string :room_no
      t.string :teacher

      t.timestamps
    end
  end
end

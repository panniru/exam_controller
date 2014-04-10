class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :dept
      t.string :semester
      t.string :subject
      t.date :date
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end

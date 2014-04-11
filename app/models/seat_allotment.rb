class SeatAllotment < ActiveRecord::Base
  
  validates :roll_from, :presence => true
  validates :roll_to, :presence => true
  validates :room_no, :presence => true
  validates :exam_date, :presence => true
  validates :dept, :presence => true
  validates :semester, :presence => true

  attr_accessor :roll_from_1, :roll_from_2, :roll_from_3, :roll_from_4   
  attr_accessor :roll_to_1, :roll_to_2, :roll_to_3, :roll_to_4   
  attr_accessor :room_no_1, :room_no_2, :room_no_3, :room_no_4   
  
  def self.columns_defined
    SeatAllotment.column_names.reject {|x| ["id", "created_at", "updated_at"].include?x}
  end

end

class ResultsDecorator < ApplicationDecorator
  decorates :result
  delegate_all
  
  def result_row
    row = []
    (1..10).each do |i| 
      if model["subject_#{i}".to_sym].present?
        row << model["subject_#{i}".to_sym]
      end
    end
    row
  end

  def total_marks
    total = 0
    Course.max_no_of_subjects.times.each  do |i| 
      if model["subject_#{i+1}".to_sym].present?
        total += model["subject_#{i+1}".to_sym]
      end
    end
    total
  end


  def subject_headers
    course.defined_subject_headers
  end

  

end

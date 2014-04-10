class Exam < ActiveRecord::Base

	def self.grouped_depts
  		Exam.select(:dept).group(:dept)
	end

end
